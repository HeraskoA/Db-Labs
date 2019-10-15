from cassandra.auth import PlainTextAuthProvider
from cassandra.cluster import Cluster
from cassandra.query import BatchStatement


cluster = Cluster(auth_provider=PlainTextAuthProvider(username='cassandra', password='cassandra'))
connection = cluster.connect('test')

batch_list = [
    '''
    UPDATE user
    SET
        data = {
             phone: 'test',
             email: 'test'
            },
        repo_count = 3
    WHERE user_id = 1 IF EXISTS;
    ''',
    '''
    UPDATE repo
    SET related_link = 'asfsaf1'
    WHERE repo_id = 1 AND user_id = 1 IF EXISTS;
    '''
]


def execute_batch(statement_list):
    batch = BatchStatement()
    for q in statement_list:
        batch.add(q)
    connection.execute(batch)


if __name__ == '__main__':
    execute_batch(batch_list)
