$USER_POOL_ID = "us-east-1_xiE7orJcZ"

aws cognito-idp list-users --user-pool-id $USER_POOL_ID > users.json