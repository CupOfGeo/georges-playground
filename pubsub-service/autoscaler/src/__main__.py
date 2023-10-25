import datetime
import time

from google.cloud import monitoring_v3
from google.cloud.monitoring_v3 import query
from googleapiclient import discovery

# Set your project and zone
project_id = 'playground-geo'
zone = 'us-central1-a'
vm_name = 'mock-big-test-vm'
# Create a Compute Engine service object
compute = discovery.build('compute', 'v1')
wait_time = 20


# TODO pool status until its in a state where it can be started and stopped
def get_vm_status():
    # https://cloud.google.com/compute/docs/instances/instance-life-cycle
    request = compute.instances().get(project=project_id, zone=zone, instance=vm_name)
    response = request.execute()
    return response['status']


def turn_on_vm():
    status = get_vm_status()
    if status == "TERMINATED":
        request = compute.instances().start(project=project_id, zone=zone, instance=vm_name)
        response = request.execute()
        print(f"Starting VM {vm_name}...")
        return 1
    elif status in ["RUNNING", "REPAIRING"]:
        print(f"VM {vm_name} is already running")
        return 1
    else:
        print(f"Failed to start VM {vm_name}: {response['status']}")
        return 0


def turn_on_till_success():
    while turn_on_vm() == 0:
        time.sleep(wait_time)


def turn_off_vm():
    # Send a request to start the VM
    status = get_vm_status()
    if status in ["RUNNING", "REPAIRING"]:
        request = compute.instances().stop(project=project_id, zone=zone, instance=vm_name)
        response = request.execute()
        print(f"Stopping VM {vm_name}...")
        return 1
    elif status in ["STOPPING", "TERMINATED"]:
        print(f"VM {vm_name} is already stopped")
        return 1
    else:
        print(f"Failed to stop VM {vm_name}: {response['status']}")
        return 0


def turn_off_till_success():
    while turn_off_vm() == 0:
        time.sleep(wait_time)


def monitor_message_count():
    project = 'playground-geo'
    sub_name = 'uploaded-images-test-sub'
    client = monitoring_v3.MetricServiceClient()
    result = query.Query(client, project, 'pubsub.googleapis.com/subscription/num_undelivered_messages',
                         end_time=datetime.datetime.now(), minutes=1).select_resources(subscription_id=sub_name)
    if len(result) == 1:
        return result[0].points[0].value.int64_value
    else:
        raise Exception('Unexpected number of results')


# Triggered by a Pub/Sub message, but we won't use the event data.
def pubsub_trigger(event, context):
    pass


def main() -> None:
    """Entrypoint of the application."""
    num_messages = monitor_message_count()
    status = get_vm_status()
    print(status)
    if num_messages > 0:
        turn_on_till_success()
    elif num_messages == 0:
        turn_off_till_success()


if __name__ == "__main__":
    main()
