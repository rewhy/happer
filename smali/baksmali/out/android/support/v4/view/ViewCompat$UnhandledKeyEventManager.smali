.class Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UnhandledKeyEventManager"
.end annotation


# static fields
.field private static final sViewsWithListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mCapturedKeys:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private mLastDispatchedPreViewKeyEvent:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/KeyEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mViewsContainingListeners:Ljava/util/WeakHashMap;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    iput-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mCapturedKeys:Landroid/util/SparseArray;

    iput-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mLastDispatchedPreViewKeyEvent:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static at(Landroid/view/View;)Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;
    .registers 3

    sget v0, Landroid/support/compat/R$id;->tag_unhandled_key_event_manager:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;

    if-nez v0, :cond_14

    new-instance v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;

    invoke-direct {v0}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;-><init>()V

    sget v1, Landroid/support/compat/R$id;->tag_unhandled_key_event_manager:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_14
    return-object v0
.end method

.method private dispatchInOrder(Landroid/view/View;Landroid/view/KeyEvent;)Landroid/view/View;
    .registers 7
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    if-eqz v0, :cond_33

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto :goto_33

    :cond_e
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2b

    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_1b
    if-ltz v2, :cond_2b

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3, p2}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->dispatchInOrder(Landroid/view/View;Landroid/view/KeyEvent;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_28

    return-object v3

    :cond_28
    add-int/lit8 v2, v2, -0x1

    goto :goto_1b

    :cond_2b
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result p2

    if-eqz p2, :cond_32

    return-object p1

    :cond_32
    return-object v1

    :cond_33
    :goto_33
    return-object v1
.end method

.method private getCapturedKeys()Landroid/util/SparseArray;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mCapturedKeys:Landroid/util/SparseArray;

    if-nez v0, :cond_b

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mCapturedKeys:Landroid/util/SparseArray;

    :cond_b
    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mCapturedKeys:Landroid/util/SparseArray;

    return-object v0
.end method

.method private onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 7
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/support/compat/R$id;->tag_unhandled_key_listeners:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_22

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_10
    if-ltz v1, :cond_22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/ViewCompat$OnUnhandledKeyEventListenerCompat;

    invoke-interface {v3, p1, p2}, Landroid/support/v4/view/ViewCompat$OnUnhandledKeyEventListenerCompat;->onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v3

    if-eqz v3, :cond_1f

    return v2

    :cond_1f
    add-int/lit8 v1, v1, -0x1

    goto :goto_10

    :cond_22
    const/4 p1, 0x0

    return p1
.end method

.method private recalcViewsWithUnhandled()V
    .registers 7

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    :cond_9
    sget-object v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    return-void

    :cond_12
    sget-object v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_15
    iget-object v1, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    if-nez v1, :cond_20

    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v1, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    :cond_20
    sget-object v1, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_28
    if-ltz v1, :cond_61

    sget-object v2, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-nez v2, :cond_40

    sget-object v2, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_5e

    :cond_40
    iget-object v3, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v2, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    :goto_4b
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_5e

    iget-object v3, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mViewsContainingListeners:Ljava/util/WeakHashMap;

    move-object v4, v2

    check-cast v4, Landroid/view/View;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_4b

    :cond_5e
    :goto_5e
    add-int/lit8 v1, v1, -0x1

    goto :goto_28

    :cond_61
    monitor-exit v0

    return-void

    :catchall_63
    move-exception v1

    monitor-exit v0
    :try_end_65
    .catchall {:try_start_15 .. :try_end_65} :catchall_63

    throw v1
.end method

.method static registerListeningView(Landroid/view/View;)V
    .registers 4

    sget-object v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    sget-object v1, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_9

    monitor-exit v0

    return-void

    :cond_1d
    sget-object v1, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_29
    move-exception p0

    monitor-exit v0
    :try_end_2b
    .catchall {:try_start_3 .. :try_end_2b} :catchall_29

    throw p0
.end method

.method static unregisterListeningView(Landroid/view/View;)V
    .registers 4

    sget-object v0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    monitor-enter v0

    const/4 v1, 0x0

    :goto_4
    :try_start_4
    sget-object v2, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_24

    sget-object v2, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_21

    sget-object p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->sViewsWithListeners:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_24
    monitor-exit v0

    return-void

    :catchall_26
    move-exception p0

    monitor-exit v0
    :try_end_28
    .catchall {:try_start_4 .. :try_end_28} :catchall_26

    throw p0
.end method


# virtual methods
.method dispatch(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 5

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_9

    invoke-direct {p0}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->recalcViewsWithUnhandled()V

    :cond_9
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->dispatchInOrder(Landroid/view/View;Landroid/view/KeyEvent;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_2b

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p2

    if-eqz p1, :cond_2b

    invoke-static {p2}, Landroid/view/KeyEvent;->isModifierKey(I)Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-direct {p0}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->getCapturedKeys()Landroid/util/SparseArray;

    move-result-object v0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2b
    if-eqz p1, :cond_2f

    const/4 p1, 0x1

    goto :goto_30

    :cond_2f
    const/4 p1, 0x0

    :goto_30
    return p1
.end method

.method preDispatch(Landroid/view/KeyEvent;)Z
    .registers 7

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mLastDispatchedPreViewKeyEvent:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mLastDispatchedPreViewKeyEvent:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_e

    return v1

    :cond_e
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->mLastDispatchedPreViewKeyEvent:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->getCapturedKeys()Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_34

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v3

    if-ltz v3, :cond_34

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->removeAt(I)V

    :cond_34
    if-nez v0, :cond_40

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    :cond_40
    if-eqz v0, :cond_54

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_53

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_53

    invoke-direct {p0, v0, p1}, Landroid/support/v4/view/ViewCompat$UnhandledKeyEventManager;->onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z

    :cond_53
    return v4

    :cond_54
    return v1
.end method
