.class Landroid/support/v4/util/ArrayMap$1;
.super Landroid/support/v4/util/MapCollections;
.source "ArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/util/ArrayMap;->getCollection()Landroid/support/v4/util/MapCollections;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/MapCollections<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/util/ArrayMap;


# direct methods
.method constructor <init>(Landroid/support/v4/util/ArrayMap;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-direct {p0}, Landroid/support/v4/util/MapCollections;-><init>()V

    return-void
.end method


# virtual methods
.method protected colClear()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/ArrayMap;->clear()V

    return-void
.end method

.method protected colGetEntry(II)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    iget-object v0, v0, Landroid/support/v4/util/ArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-object p1, v0, p1

    return-object p1
.end method

.method protected colGetMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    return-object v0
.end method

.method protected colGetSize()I
    .registers 2

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    iget v0, v0, Landroid/support/v4/util/ArrayMap;->mSize:I

    return v0
.end method

.method protected colIndexOfKey(Ljava/lang/Object;)I
    .registers 3

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method protected colIndexOfValue(Ljava/lang/Object;)I
    .registers 3

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->indexOfValue(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method protected colPut(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected colRemoveAt(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    return-void
.end method

.method protected colSetValue(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/ArrayMap;->setValueAt(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
