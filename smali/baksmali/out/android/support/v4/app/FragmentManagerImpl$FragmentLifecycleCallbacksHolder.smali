.class final Landroid/support/v4/app/FragmentManagerImpl$FragmentLifecycleCallbacksHolder;
.super Ljava/lang/Object;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/FragmentManagerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FragmentLifecycleCallbacksHolder"
.end annotation


# instance fields
.field final mCallback:Landroid/support/v4/app/FragmentManager$FragmentLifecycleCallbacks;

.field final mRecursive:Z


# direct methods
.method constructor <init>(Landroid/support/v4/app/FragmentManager$FragmentLifecycleCallbacks;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/FragmentManagerImpl$FragmentLifecycleCallbacksHolder;->mCallback:Landroid/support/v4/app/FragmentManager$FragmentLifecycleCallbacks;

    iput-boolean p2, p0, Landroid/support/v4/app/FragmentManagerImpl$FragmentLifecycleCallbacksHolder;->mRecursive:Z

    return-void
.end method
