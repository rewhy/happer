.class Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;
.super Landroid/widget/BaseAdapter;
.source "Tasks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/markuspage/android/atimetracker/Tasks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TaskAdapter"
.end annotation


# instance fields
.field private currentRangeEnd:J

.field private currentRangeStart:J

.field private dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

.field private savedContext:Landroid/content/Context;

.field protected tasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/markuspage/android/atimetracker/Task;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/markuspage/android/atimetracker/Tasks;


# direct methods
.method public constructor <init>(Lcom/markuspage/android/atimetracker/Tasks;Landroid/content/Context;)V
    .registers 3

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p2, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->savedContext:Landroid/content/Context;

    new-instance p1, Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-direct {p1, p2}, Lcom/markuspage/android/atimetracker/DBHelper;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$1200(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)V
    .registers 1

    invoke-direct {p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks()V

    return-void
.end method

.method static synthetic access$400(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J
    .registers 3

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;)J
    .registers 3

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeEnd:J

    return-wide v0
.end method

.method private loadTasks()V
    .registers 3

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeEnd:J

    iput-wide v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J

    const-string v0, ""

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/lang/String;Z)V

    return-void
.end method

.method private loadTasks(Ljava/lang/String;Z)V
    .registers 16

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "tasks"

    sget-object v3, Lcom/markuspage/android/atimetracker/DBHelper;->TASK_COLUMNS:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, v0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    const/4 v10, 0x1

    if-eqz v1, :cond_86

    :cond_20
    const/4 v11, 0x0

    invoke-interface {v9, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    new-array v5, v10, [Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v11

    new-instance v12, Lcom/markuspage/android/atimetracker/Task;

    invoke-interface {v9, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v12, v2, v1}, Lcom/markuspage/android/atimetracker/Task;-><init>(Ljava/lang/String;I)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT SUM(end) - SUM(start) AS total FROM ranges WHERE task_id = ? AND end NOTNULL "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v12, v2, v3}, Lcom/markuspage/android/atimetracker/Task;->setCollapsed(J)V

    :cond_58
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    if-eqz p2, :cond_7b

    const-string v2, "ranges"

    sget-object v3, Lcom/markuspage/android/atimetracker/DBHelper;->RANGE_COLUMNS:[Ljava/lang/String;

    const-string v4, "task_id = ? AND end ISNULL"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, v0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_78

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v12, v2, v3}, Lcom/markuspage/android/atimetracker/Task;->setStartTime(J)V

    :cond_78
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_7b
    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_20

    :cond_86
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->findCurrentlyActive()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    xor-int/2addr p2, v10

    # setter for: Lcom/markuspage/android/atimetracker/Tasks;->running:Z
    invoke-static {p1, p2}, Lcom/markuspage/android/atimetracker/Tasks;->access$002(Lcom/markuspage/android/atimetracker/Tasks;Z)Z

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method private makeWhereClause(Ljava/util/Calendar;Ljava/util/Calendar;)[Ljava/lang/String;
    .registers 16

    const-string v0, "AND start < %d AND start >= %d"

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;
    invoke-static {v2}, Lcom/markuspage/android/atimetracker/Tasks;->access$1000(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "start_day"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->setFirstDayOfWeek(I)V

    const/16 v2, 0xb

    const/16 v5, 0xc

    invoke-virtual {v1, v2, v5}, Ljava/util/Calendar;->set(II)V

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_8e

    array-length v5, v2

    const/4 v6, 0x0

    :goto_27
    const/4 v7, 0x2

    if-ge v6, v5, :cond_48

    aget v8, v2, v6

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/util/Calendar;

    aput-object v1, v9, v4

    aput-object p1, v9, v3

    aput-object p2, v9, v7

    array-length v7, v9

    const/4 v10, 0x0

    :goto_37
    if-ge v10, v7, :cond_45

    aget-object v11, v9, v10

    invoke-virtual {v11, v8}, Ljava/util/Calendar;->getMinimum(I)I

    move-result v12

    invoke-virtual {v11, v8, v12}, Ljava/util/Calendar;->set(II)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_37

    :cond_45
    add-int/lit8 v6, v6, 0x1

    goto :goto_27

    :cond_48
    const/4 v2, 0x5

    invoke-virtual {p2, v2, v3}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J

    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeEnd:J

    invoke-virtual {v1, p1}, Ljava/util/Calendar;->compareTo(Ljava/util/Calendar;)I

    move-result v2

    const/4 v5, -0x1

    if-eq v2, v5, :cond_67

    invoke-virtual {v1, p2}, Ljava/util/Calendar;->compareTo(Ljava/util/Calendar;)I

    move-result v1

    if-eq v1, v3, :cond_67

    const/4 v1, 0x1

    goto :goto_68

    :cond_67
    const/4 v1, 0x0

    :goto_68
    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v2, v4

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-array p2, v7, [Ljava/lang/String;

    aput-object p1, p2, v4

    if-eqz v1, :cond_89

    goto :goto_8a

    :cond_89
    const/4 p1, 0x0

    :goto_8a
    aput-object p1, p2, v3

    return-object p2

    nop

    :array_8e
    .array-data 4
        0xb
        0xc
        0xd
        0xe
    .end array-data
.end method


# virtual methods
.method protected addTask(Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "name"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "tasks"

    const-string v3, "name"

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    new-instance v2, Lcom/markuspage/android/atimetracker/Task;

    long-to-int v0, v0

    invoke-direct {v2, p1, v0}, Lcom/markuspage/android/atimetracker/Task;-><init>(Ljava/lang/String;I)V

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public close()V
    .registers 2

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/DBHelper;->close()V

    return-void
.end method

.method public deleteTask(Lcom/markuspage/android/atimetracker/Task;)V
    .registers 5

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "tasks"

    const-string v2, "ROWID = ?"

    invoke-virtual {v0, p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const-string p1, "ranges"

    const-string v2, "task_id = ?"

    invoke-virtual {v0, p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public findCurrentlyActive()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/markuspage/android/atimetracker/Task;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {v2}, Lcom/markuspage/android/atimetracker/Task;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_21
    return-object v0
.end method

.method public getCount()I
    .registers 2

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected getCurrentRange()Landroid/database/Cursor;
    .registers 8

    const-string v0, ""

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    iget-wide v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J

    const-wide/16 v3, -0x1

    const/4 v5, 0x0

    cmp-long v6, v1, v3

    if-eqz v6, :cond_4d

    iget-wide v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeEnd:J

    cmp-long v6, v1, v3

    if-eqz v6, :cond_4d

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/markuspage/android/atimetracker/Tasks;->access$1000(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "start_day"

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setFirstDayOfWeek(I)V

    iget-wide v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeStart:J

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    iget-object v2, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks;->preferences:Landroid/content/SharedPreferences;
    invoke-static {v2}, Lcom/markuspage/android/atimetracker/Tasks;->access$1000(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "start_day"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->setFirstDayOfWeek(I)V

    iget-wide v2, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->currentRangeEnd:J

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-direct {p0, v0, v1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->makeWhereClause(Ljava/util/Calendar;Ljava/util/Calendar;)[Ljava/lang/String;

    move-result-object v0

    :cond_4d
    iget-object v1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {v1}, Lcom/markuspage/android/atimetracker/DBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SELECT t.name, r.start, r.end  FROM tasks t, ranges r  WHERE r.task_id = t.ROWID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v0, v0, v5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ORDER BY t.name, r.start ASC"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    if-nez p2, :cond_16

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_14

    new-instance p2, Lcom/markuspage/android/atimetracker/Tasks$TaskView;

    iget-object p3, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->savedContext:Landroid/content/Context;

    check-cast p1, Lcom/markuspage/android/atimetracker/Task;

    invoke-direct {p2, p3, v0, p1}, Lcom/markuspage/android/atimetracker/Tasks$TaskView;-><init>(Lcom/markuspage/android/atimetracker/Tasks;Landroid/content/Context;Lcom/markuspage/android/atimetracker/Task;)V

    goto :goto_23

    :cond_14
    const/4 p2, 0x0

    goto :goto_23

    :cond_16
    check-cast p2, Lcom/markuspage/android/atimetracker/Tasks$TaskView;

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_23

    check-cast p1, Lcom/markuspage/android/atimetracker/Task;

    invoke-virtual {p2, p1}, Lcom/markuspage/android/atimetracker/Tasks$TaskView;->setTask(Lcom/markuspage/android/atimetracker/Task;)V

    :cond_23
    :goto_23
    return-object p2
.end method

.method protected loadTasks(Ljava/util/Calendar;)V
    .registers 3

    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    invoke-virtual {p0, p1, v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/util/Calendar;Ljava/util/Calendar;)V

    return-void
.end method

.method protected loadTasks(Ljava/util/Calendar;Ljava/util/Calendar;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->makeWhereClause(Ljava/util/Calendar;Ljava/util/Calendar;)[Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aget-object v0, p1, p2

    const/4 v1, 0x1

    aget-object p1, p1, v1

    if-nez p1, :cond_d

    goto :goto_e

    :cond_d
    const/4 p2, 0x1

    :goto_e
    invoke-direct {p0, v0, p2}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->loadTasks(Ljava/lang/String;Z)V

    return-void
.end method

.method protected updateTask(Lcom/markuspage/android/atimetracker/Task;)V
    .registers 13

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->dbHelper:Lcom/markuspage/android/atimetracker/DBHelper;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "name"

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v6, "tasks"

    const-string v7, "ROWID = ?"

    invoke-virtual {v0, v6, v1, v7, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getStartTime()J

    move-result-wide v6

    const-wide/16 v8, -0x1

    cmp-long v4, v6, v8

    if-eqz v4, :cond_81

    invoke-virtual {v1}, Landroid/content/ContentValues;->clear()V

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getStartTime()J

    move-result-wide v6

    const-string v4, "start"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v1, v4, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    aput-object v2, v4, v5

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v3

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getEndTime()J

    move-result-wide v2

    cmp-long v5, v2, v8

    if-eqz v5, :cond_63

    const-string v2, "end"

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getEndTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_63
    const-string v2, "ranges"

    const-string v3, "task_id = ? AND start = ?"

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_81

    const-string v2, "task_id"

    invoke-virtual {p1}, Lcom/markuspage/android/atimetracker/Task;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "ranges"

    const-string v2, "end"

    invoke-virtual {v0, p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    :cond_81
    iget-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->tasks:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-virtual {p0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->notifyDataSetChanged()V

    return-void
.end method
