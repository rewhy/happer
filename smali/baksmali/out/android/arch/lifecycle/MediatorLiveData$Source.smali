.class Landroid/arch/lifecycle/MediatorLiveData$Source;
.super Ljava/lang/Object;
.source "MediatorLiveData.java"

# interfaces
.implements Landroid/arch/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/lifecycle/MediatorLiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Source"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/arch/lifecycle/Observer<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final mLiveData:Landroid/arch/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/lifecycle/LiveData<",
            "TV;>;"
        }
    .end annotation
.end field

.field final mObserver:Landroid/arch/lifecycle/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/lifecycle/Observer<",
            "TV;>;"
        }
    .end annotation
.end field

.field mVersion:I


# direct methods
.method constructor <init>(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/Observer;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/arch/lifecycle/LiveData<",
            "TV;>;",
            "Landroid/arch/lifecycle/Observer<",
            "TV;>;)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method public onChanged(Ljava/lang/Object;)V
    .registers 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method plug()V
    .registers 2

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method unplug()V
    .registers 2

    return-void

    nop

    nop

    nop

    nop

    nop
.end method
