.class public Landroid/arch/lifecycle/MediatorLiveData;
.super Landroid/arch/lifecycle/MutableLiveData;
.source "MediatorLiveData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/arch/lifecycle/MediatorLiveData$Source;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/arch/lifecycle/MutableLiveData<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mSources:Landroid/arch/core/internal/SafeIterableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/core/internal/SafeIterableMap<",
            "Landroid/arch/lifecycle/LiveData<",
            "*>;",
            "Landroid/arch/lifecycle/MediatorLiveData$Source<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

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
.method public addSource(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/Observer;)V
    .registers 5
    .param p1    # Landroid/arch/lifecycle/LiveData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/arch/lifecycle/Observer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/arch/lifecycle/LiveData<",
            "TS;>;",
            "Landroid/arch/lifecycle/Observer<",
            "TS;>;)V"
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

.method protected onActive()V
    .registers 3
    .annotation build Landroid/support/annotation/CallSuper;
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

    nop

    nop

    nop

    nop

    nop
.end method

.method protected onInactive()V
    .registers 3
    .annotation build Landroid/support/annotation/CallSuper;
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

    nop

    nop

    nop

    nop

    nop
.end method

.method public removeSource(Landroid/arch/lifecycle/LiveData;)V
    .registers 3
    .param p1    # Landroid/arch/lifecycle/LiveData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/arch/lifecycle/LiveData<",
            "TS;>;)V"
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
.end method
