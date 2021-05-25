.class public final Landroid/support/v4/widget/DirectedAcyclicGraph;
.super Ljava/lang/Object;
.source "DirectedAcyclicGraph.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mGraph:Landroid/support/v4/util/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SimpleArrayMap<",
            "TT;",
            "Ljava/util/ArrayList<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final mListPool:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Ljava/util/ArrayList<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final mSortResult:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mSortTmpMarked:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v4/util/Pools$SimplePool;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroid/support/v4/util/Pools$SimplePool;-><init>(I)V

    iput-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mListPool:Landroid/support/v4/util/Pools$Pool;

    new-instance v0, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortResult:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortTmpMarked:Ljava/util/HashSet;

    return-void
.end method

.method private dfs(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/util/ArrayList<",
            "TT;>;",
            "Ljava/util/HashSet<",
            "TT;>;)V"
        }
    .end annotation

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2b

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_1f
    if-ge v1, v2, :cond_2b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {p0, v3, p2, p3}, Landroid/support/v4/widget/DirectedAcyclicGraph;->dfs(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    :cond_2b
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_32
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "This graph contains cyclic dependencies"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getEmptyList()Ljava/util/ArrayList;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mListPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_f
    return-object v0
.end method

.method private poolList(Ljava/util/ArrayList;)V
    .registers 3
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mListPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p1}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public addEdge(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p2}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_23

    invoke-direct {p0}, Landroid/support/v4/widget/DirectedAcyclicGraph;->getEmptyList()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_27
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "All nodes must be present in the graph before being added as an edge"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addNode(Ljava/lang/Object;)V
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    return-void
.end method

.method public clear()V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_19

    iget-object v2, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v2, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_16

    invoke-direct {p0, v2}, Landroid/support/v4/widget/DirectedAcyclicGraph;->poolList(Ljava/util/ArrayList;)V

    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_19
    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getIncomingEdges(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1
.end method

.method public getOutgoingEdges(Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_2d

    iget-object v3, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v3, v2}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_2a

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    if-nez v1, :cond_21

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_21
    iget-object v3, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v3, v2}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_2d
    return-object v1
.end method

.method public getSortedList()Ljava/util/ArrayList;
    .registers 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortResult:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortTmpMarked:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_11
    if-ge v1, v0, :cond_23

    iget-object v2, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v2, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortResult:Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortTmpMarked:Ljava/util/HashSet;

    invoke-direct {p0, v2, v3, v4}, Landroid/support/v4/widget/DirectedAcyclicGraph;->dfs(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_23
    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mSortResult:Ljava/util/ArrayList;

    return-object v0
.end method

.method public hasOutgoingEdges(Ljava/lang/Object;)Z
    .registers 6
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_1f

    iget-object v3, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v3, v2}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_1c

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    const/4 p1, 0x1

    return p1

    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1f
    return v1
.end method

.method size()I
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/DirectedAcyclicGraph;->mGraph:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v0

    return v0
.end method
