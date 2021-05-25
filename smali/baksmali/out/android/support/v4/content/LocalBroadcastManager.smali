.class public final Landroid/support/v4/content/LocalBroadcastManager;
.super Ljava/lang/Object;
.source "LocalBroadcastManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;,
        Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final MSG_EXEC_PENDING_BROADCASTS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "LocalBroadcastManager"

.field private static mInstance:Landroid/support/v4/content/LocalBroadcastManager;

.field private static final mLock:Ljava/lang/Object;


# instance fields
.field private final mActions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mAppContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final mPendingBroadcasts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final mReceivers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/content/BroadcastReceiver;",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/content/LocalBroadcastManager;->mLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mActions:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mPendingBroadcasts:Ljava/util/ArrayList;

    iput-object p1, p0, Landroid/support/v4/content/LocalBroadcastManager;->mAppContext:Landroid/content/Context;

    new-instance v0, Landroid/support/v4/content/LocalBroadcastManager$1;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Landroid/support/v4/content/LocalBroadcastManager$1;-><init>(Landroid/support/v4/content/LocalBroadcastManager;Landroid/os/Looper;)V

    iput-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;
    .registers 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Landroid/support/v4/content/LocalBroadcastManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Landroid/support/v4/content/LocalBroadcastManager;->mInstance:Landroid/support/v4/content/LocalBroadcastManager;

    if-nez v1, :cond_12

    new-instance v1, Landroid/support/v4/content/LocalBroadcastManager;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/support/v4/content/LocalBroadcastManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Landroid/support/v4/content/LocalBroadcastManager;->mInstance:Landroid/support/v4/content/LocalBroadcastManager;

    :cond_12
    sget-object p0, Landroid/support/v4/content/LocalBroadcastManager;->mInstance:Landroid/support/v4/content/LocalBroadcastManager;

    monitor-exit v0

    return-object p0

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw p0
.end method


# virtual methods
.method executePendingBroadcasts()V
    .registers 10

    :cond_0
    iget-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v4/content/LocalBroadcastManager;->mPendingBroadcasts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_d

    monitor-exit v0

    return-void

    :cond_d
    new-array v1, v1, [Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;

    iget-object v2, p0, Landroid/support/v4/content/LocalBroadcastManager;->mPendingBroadcasts:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/content/LocalBroadcastManager;->mPendingBroadcasts:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_45

    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_1c
    array-length v3, v1

    if-ge v2, v3, :cond_0

    aget-object v3, v1, v2

    iget-object v4, v3, Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;->receivers:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_28
    if-ge v5, v4, :cond_42

    iget-object v6, v3, Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;->receivers:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;

    iget-boolean v7, v6, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->dead:Z

    if-nez v7, :cond_3f

    iget-object v6, v6, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->receiver:Landroid/content/BroadcastReceiver;

    iget-object v7, p0, Landroid/support/v4/content/LocalBroadcastManager;->mAppContext:Landroid/content/Context;

    iget-object v8, v3, Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;->intent:Landroid/content/Intent;

    invoke-virtual {v6, v7, v8}, Landroid/content/BroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_3f
    add-int/lit8 v5, v5, 0x1

    goto :goto_28

    :cond_42
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    :catchall_45
    move-exception v1

    :try_start_46
    monitor-exit v0
    :try_end_47
    .catchall {:try_start_46 .. :try_end_47} :catchall_45

    throw v1
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V
    .registers 9
    .param p1    # Landroid/content/BroadcastReceiver;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/IntentFilter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_3
    new-instance v1, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;

    invoke-direct {v1, p2, p1}, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;-><init>(Landroid/content/IntentFilter;Landroid/content/BroadcastReceiver;)V

    iget-object v2, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    if-nez v2, :cond_1d

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v4, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    invoke-virtual {v4, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    :goto_21
    invoke-virtual {p2}, Landroid/content/IntentFilter;->countActions()I

    move-result v2

    if-ge p1, v2, :cond_45

    invoke-virtual {p2, p1}, Landroid/content/IntentFilter;->getAction(I)Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Landroid/support/v4/content/LocalBroadcastManager;->mActions:Ljava/util/HashMap;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    if-nez v4, :cond_3f

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v5, p0, Landroid/support/v4/content/LocalBroadcastManager;->mActions:Ljava/util/HashMap;

    invoke-virtual {v5, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3f
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_21

    :cond_45
    monitor-exit v0

    return-void

    :catchall_47
    move-exception p1

    monitor-exit v0
    :try_end_49
    .catchall {:try_start_3 .. :try_end_49} :catchall_47

    throw p1
.end method

.method public sendBroadcast(Landroid/content/Intent;)Z
    .registers 23
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    iget-object v2, v1, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_7
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    iget-object v3, v1, Landroid/support/v4/content/LocalBroadcastManager;->mAppContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getFlags()I

    move-result v3

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_2c

    const/16 v16, 0x1

    goto :goto_2e

    :cond_2c
    const/16 v16, 0x0

    :goto_2e
    if-eqz v16, :cond_56

    const-string v3, "LocalBroadcastManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resolving type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " scheme "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " of intent "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_56
    iget-object v3, v1, Landroid/support/v4/content/LocalBroadcastManager;->mActions:Ljava/util/HashMap;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Ljava/util/ArrayList;

    if-eqz v8, :cond_169

    if-eqz v16, :cond_7d

    const-string v3, "LocalBroadcastManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Action list: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7d
    const/4 v3, 0x0

    move-object v6, v3

    const/4 v7, 0x0

    :goto_80
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v7, v3, :cond_139

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;

    if-eqz v16, :cond_a7

    const-string v3, "LocalBroadcastManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Matching against filter "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v5, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->filter:Landroid/content/IntentFilter;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a7
    iget-boolean v3, v5, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->broadcasting:Z

    if-eqz v3, :cond_c0

    if-eqz v16, :cond_b4

    const-string v3, "LocalBroadcastManager"

    const-string v4, "  Filter\'s target already added"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b4
    move/from16 v18, v7

    move-object/from16 v19, v8

    move-object/from16 v17, v10

    move-object/from16 v20, v11

    const/4 v11, 0x1

    move-object v10, v6

    goto/16 :goto_12e

    :cond_c0
    iget-object v3, v5, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->filter:Landroid/content/IntentFilter;

    const-string v9, "LocalBroadcastManager"

    move-object v4, v10

    move-object v15, v5

    move-object v5, v11

    move-object/from16 v17, v10

    move-object v10, v6

    move-object v6, v13

    move/from16 v18, v7

    move-object v7, v12

    move-object/from16 v19, v8

    move-object v8, v14

    move-object/from16 v20, v11

    const/4 v11, 0x1

    invoke-virtual/range {v3 .. v9}, Landroid/content/IntentFilter;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_105

    if-eqz v16, :cond_f6

    const-string v4, "LocalBroadcastManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  Filter matched!  match=0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f6
    if-nez v10, :cond_fe

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    goto :goto_ff

    :cond_fe
    move-object v6, v10

    :goto_ff
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v11, v15, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->broadcasting:Z

    goto :goto_12f

    :cond_105
    if-eqz v16, :cond_12e

    packed-switch v3, :pswitch_data_170

    const-string v3, "unknown reason"

    goto :goto_118

    :pswitch_10d
    const-string v3, "type"

    goto :goto_118

    :pswitch_110
    const-string v3, "data"

    goto :goto_118

    :pswitch_113
    const-string v3, "action"

    goto :goto_118

    :pswitch_116
    const-string v3, "category"

    :goto_118
    const-string v4, "LocalBroadcastManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  Filter did not match: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12e
    :goto_12e
    move-object v6, v10

    :goto_12f
    add-int/lit8 v7, v18, 0x1

    move-object/from16 v10, v17

    move-object/from16 v8, v19

    move-object/from16 v11, v20

    goto/16 :goto_80

    :cond_139
    move-object v10, v6

    const/4 v11, 0x1

    if-eqz v10, :cond_169

    const/4 v3, 0x0

    :goto_13e
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_150

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;

    const/4 v5, 0x0

    iput-boolean v5, v4, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->broadcasting:Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_13e

    :cond_150
    iget-object v3, v1, Landroid/support/v4/content/LocalBroadcastManager;->mPendingBroadcasts:Ljava/util/ArrayList;

    new-instance v4, Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;

    invoke-direct {v4, v0, v10}, Landroid/support/v4/content/LocalBroadcastManager$BroadcastRecord;-><init>(Landroid/content/Intent;Ljava/util/ArrayList;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Landroid/support/v4/content/LocalBroadcastManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v11}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_167

    iget-object v0, v1, Landroid/support/v4/content/LocalBroadcastManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_167
    monitor-exit v2

    return v11

    :cond_169
    monitor-exit v2

    const/4 v0, 0x0

    return v0

    :catchall_16c
    move-exception v0

    monitor-exit v2
    :try_end_16e
    .catchall {:try_start_7 .. :try_end_16e} :catchall_16c

    throw v0

    nop

    :pswitch_data_170
    .packed-switch -0x4
        :pswitch_116
        :pswitch_113
        :pswitch_110
        :pswitch_10d
    .end packed-switch
.end method

.method public sendBroadcastSync(Landroid/content/Intent;)V
    .registers 2
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-virtual {p0}, Landroid/support/v4/content/LocalBroadcastManager;->executePendingBroadcasts()V

    :cond_9
    return-void
.end method

.method public unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .registers 13
    .param p1    # Landroid/content/BroadcastReceiver;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v4/content/LocalBroadcastManager;->mReceivers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_f

    monitor-exit v0

    return-void

    :cond_f
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_15
    if-ltz v2, :cond_62

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;

    iput-boolean v3, v4, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->dead:Z

    const/4 v5, 0x0

    :goto_20
    iget-object v6, v4, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->filter:Landroid/content/IntentFilter;

    invoke-virtual {v6}, Landroid/content/IntentFilter;->countActions()I

    move-result v6

    if-ge v5, v6, :cond_5f

    iget-object v6, v4, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->filter:Landroid/content/IntentFilter;

    invoke-virtual {v6, v5}, Landroid/content/IntentFilter;->getAction(I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Landroid/support/v4/content/LocalBroadcastManager;->mActions:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    if-eqz v7, :cond_5c

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v8, v3

    :goto_3d
    if-ltz v8, :cond_51

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;

    iget-object v10, v9, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->receiver:Landroid/content/BroadcastReceiver;

    if-ne v10, p1, :cond_4e

    iput-boolean v3, v9, Landroid/support/v4/content/LocalBroadcastManager$ReceiverRecord;->dead:Z

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_4e
    add-int/lit8 v8, v8, -0x1

    goto :goto_3d

    :cond_51
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-gtz v7, :cond_5c

    iget-object v7, p0, Landroid/support/v4/content/LocalBroadcastManager;->mActions:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5c
    add-int/lit8 v5, v5, 0x1

    goto :goto_20

    :cond_5f
    add-int/lit8 v2, v2, -0x1

    goto :goto_15

    :cond_62
    monitor-exit v0

    return-void

    :catchall_64
    move-exception p1

    monitor-exit v0
    :try_end_66
    .catchall {:try_start_3 .. :try_end_66} :catchall_64

    throw p1
.end method
