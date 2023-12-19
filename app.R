library(dotenv)
library(mongolite)

load_dot_env(file = ".env")

mongo_user        <- Sys.getenv('MONGO_USER')
mongo_password    <- Sys.getenv('MONGO_PASSWORD')
mongo_host        <- Sys.getenv('MONGO_HOST')
mongo_port        <- Sys.getenv('MONGO_PORT')
mongo_database    <- Sys.getenv('MONGO_DATABASE')
mongo_collection  <- Sys.getenv('MONGO_COLLECTION')

m <- mongo(
    db = mongo_database, 
    collection = mongo_collection, 
    url = sprintf("mongodb://%s:%s@%s:%s/?authSource=admin", mongo_user, mongo_password, mongo_host, mongo_port)
)

docsCount <- m$count()

print(docsCount)
