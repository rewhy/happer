.class Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;
.super Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsBaseImpl;
.source "FrameMetricsAggregator.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x18
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/FrameMetricsAggregator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FrameMetricsApi24Impl"
.end annotation


# static fields
.field private static final NANOS_PER_MS:I = 0xf4240

.field private static final NANOS_ROUNDING_VALUE:I = 0x7a120

.field private static sHandler:Landroid/os/Handler;

.field private static sHandlerThread:Landroid/os/HandlerThread;


# instance fields
.field private mActivities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;>;"
        }
    .end annotation
.end field

.field mListener:Landroid/view/Window$OnFrameMetricsAvailableListener;

.field mMetrics:[Landroid/util/SparseIntArray;

.field mTrackingFlags:I


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsBaseImpl;-><init>()V

    const/16 v0, 0x9

    new-array v0, v0, [Landroid/util/SparseIntArray;

    iput-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    new-instance v0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl$1;

    invoke-direct {v0, p0}, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl$1;-><init>(Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;)V

    iput-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mListener:Landroid/view/Window$OnFrameMetricsAvailableListener;

    iput p1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mTrackingFlags:I

    return-void
.end method


# virtual methods
.method public add(Landroid/app/Activity;)V
    .registers 5

    sget-object v0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->sHandlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_1f

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "FrameMetricsAggregator"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->sHandlerThread:Landroid/os/HandlerThread;

    sget-object v0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->sHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    sget-object v1, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->sHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->sHandler:Landroid/os/Handler;

    :cond_1f
    const/4 v0, 0x0

    :goto_20
    const/16 v1, 0x8

    if-gt v0, v1, :cond_3d

    iget-object v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    aget-object v1, v1, v0

    if-nez v1, :cond_3a

    iget v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mTrackingFlags:I

    const/4 v2, 0x1

    shl-int/2addr v2, v0

    and-int/2addr v1, v2

    if-eqz v1, :cond_3a

    iget-object v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    new-instance v2, Landroid/util/SparseIntArray;

    invoke-direct {v2}, Landroid/util/SparseIntArray;-><init>()V

    aput-object v2, v1, v0

    :cond_3a
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_3d
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mListener:Landroid/view/Window$OnFrameMetricsAvailableListener;

    sget-object v2, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->sHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->addOnFrameMetricsAvailableListener(Landroid/view/Window$OnFrameMetricsAvailableListener;Landroid/os/Handler;)V

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addDurationItem(Landroid/util/SparseIntArray;J)V
    .registers 8

    if-eqz p1, :cond_1a

    const-wide/32 v0, 0x7a120

    add-long/2addr v0, p2

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    long-to-int v0, v0

    const-wide/16 v1, 0x0

    cmp-long v3, p2, v1

    if-ltz v3, :cond_1a

    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, v0, p2}, Landroid/util/SparseIntArray;->put(II)V

    :cond_1a
    return-void
.end method

.method public getMetrics()[Landroid/util/SparseIntArray;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    return-object v0
.end method

.method public remove(Landroid/app/Activity;)[Landroid/util/SparseIntArray;
    .registers 5

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_6

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_1d
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mListener:Landroid/view/Window$OnFrameMetricsAvailableListener;

    invoke-virtual {p1, v0}, Landroid/view/Window;->removeOnFrameMetricsAvailableListener(Landroid/view/Window$OnFrameMetricsAvailableListener;)V

    iget-object p1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    return-object p1
.end method

.method public reset()[Landroid/util/SparseIntArray;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    const/16 v1, 0x9

    new-array v1, v1, [Landroid/util/SparseIntArray;

    iput-object v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    return-object v0
.end method

.method public stop()[Landroid/util/SparseIntArray;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_2f

    iget-object v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2c

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mListener:Landroid/view/Window$OnFrameMetricsAvailableListener;

    invoke-virtual {v1, v2}, Landroid/view/Window;->removeOnFrameMetricsAvailableListener(Landroid/view/Window$OnFrameMetricsAvailableListener;)V

    iget-object v1, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mActivities:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2c
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_2f
    iget-object v0, p0, Landroid/support/v4/app/FrameMetricsAggregator$FrameMetricsApi24Impl;->mMetrics:[Landroid/util/SparseIntArray;

    return-object v0
.end method
