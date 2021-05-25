.class public Lcom/markuspage/android/atimetracker/DBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBHelper.java"


# static fields
.field private static final CREATE_TASK_TABLE:Ljava/lang/String; = "CREATE TABLE %s (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT COLLATE LOCALIZED NOT NULL);"

.field public static final DBVERSION:I = 0x5

.field public static final END:Ljava/lang/String; = "end"

.field public static final ID_NAME:Ljava/lang/String; = "_id"

.field public static final NAME:Ljava/lang/String; = "name"

.field public static final RANGES_TABLE:Ljava/lang/String; = "ranges"

.field public static final RANGE_COLUMNS:[Ljava/lang/String;

.field public static final START:Ljava/lang/String; = "start"

.field public static final TASK_COLUMNS:[Ljava/lang/String;

.field public static final TASK_ID:Ljava/lang/String; = "task_id"

.field public static final TASK_NAME:Ljava/lang/String; = "name"

.field public static final TASK_TABLE:Ljava/lang/String; = "tasks"

.field public static final TIMETRACKER_DB_NAME:Ljava/lang/String; = "timetracker.db"

.field private static instance:Lcom/markuspage/android/atimetracker/DBHelper;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "start"

    const-string v1, "end"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/markuspage/android/atimetracker/DBHelper;->RANGE_COLUMNS:[Ljava/lang/String;

    const-string v0, "ROWID"

    const-string v1, "name"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/markuspage/android/atimetracker/DBHelper;->TASK_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const-string v0, "timetracker.db"

    const/4 v1, 0x0

    const/4 v2, 0x5

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    sput-object p0, Lcom/markuspage/android/atimetracker/DBHelper;->instance:Lcom/markuspage/android/atimetracker/DBHelper;

    return-void
.end method

.method public static getInstance()Lcom/markuspage/android/atimetracker/DBHelper;
    .registers 1

    sget-object v0, Lcom/markuspage/android/atimetracker/DBHelper;->instance:Lcom/markuspage/android/atimetracker/DBHelper;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 6

    const-string v0, "CREATE TABLE %s (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT COLLATE LOCALIZED NOT NULL);"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "tasks"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE ranges(task_id INTEGER NOT NULL,start INTEGER NOT NULL,end INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 7

    const/4 p3, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x4

    if-ge p2, v1, :cond_38

    const-string p2, "CREATE TABLE %s (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT COLLATE LOCALIZED NOT NULL);"

    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "temp"

    aput-object v2, v1, p3

    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "insert into temp(rowid,name) select rowid,name from tasks;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "drop table tasks;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "CREATE TABLE %s (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT COLLATE LOCALIZED NOT NULL);"

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "tasks"

    aput-object v1, v0, p3

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "insert into tasks(_id,name) select rowid,name from temp;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "drop table temp;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_6d

    :cond_38
    const/4 v1, 0x5

    if-ge p2, v1, :cond_6d

    const-string p2, "CREATE TABLE %s (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT COLLATE LOCALIZED NOT NULL);"

    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "temp"

    aput-object v2, v1, p3

    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "insert into temp(_id,name) select rowid,name from tasks;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "drop table tasks;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "CREATE TABLE %s (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT COLLATE LOCALIZED NOT NULL);"

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "tasks"

    aput-object v1, v0, p3

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "insert into tasks(_id,name) select _id,name from temp;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p2, "drop table temp;"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_6d
    :goto_6d
    return-void
.end method
