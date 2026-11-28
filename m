Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881098;
	b=JNuM/nO01MutXHDCsWaAAcxhJxZn2YS/msdRECDk7kG3Uj85lWMdRnVCz6nI4lbMPdko
	 H64cubq08wYhmgxiy7KDFLsYqtOrMzvKBlWdC2Np/CPn/1tvWJ2Px+Hp/wfQYKxsRqXLz
	 9J3OcpJriKXhP7n+cdU2HYYGPFPrXjbpJjWsa4I2X6xjDzflnGNp/dw7AL9hEz/7STft1
	 rs/E4M+R93NbfAjLiipdxGYJmdE1JQ+rIxnyj805KOUr28mveJ4lUlQ1QKVzSYO0v2yen
	 aEHBmdebk/tqVg5yW78NyG8ncfudqVzg62pftEPcySIWHUEHJEwH3vgXqocxAx4t5IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881098;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m3CbVIv6p+TKc2tS/mS94O+AyHnSC7+j1z8eUmEW0HE=;
	b=NAmOgjP9XaBnUpRmdmQ5+xCnuDhnSUpUWi63NeimKb+gNMtdLKQYCLhGvSlv1sJ70NOA
	 +CX7qrS2N1rHEQeM8kFf2fvaz+h4FMqbanfop466hAVW+RybFoVD6f+2VVUOyegnUd6yn
	 B55PrakhENihM9iXtCgh7CDTy4sGvnPRyXMFGbnySlObZ5qdj7CTvY3sqz94CNAcsZJR8
	 hta1slulKxV6PbbER4cHgC1c34pDHG/kaGUOpVL0Yt1JtSPxUKfe3/6oPlPB3WEvgsiFe
	 B7tD1p4DnEb7R4RDSf3R0mO9Lx0izI4PlT5KRRkkrFOiP+c984/Jhj1rmyv3KnFogmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSxmPGqP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4791606A31C
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSxmPGqP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D44C1F00898;
	Sat, 28 Nov 2026 15:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795881098;
	bh=m3CbVIv6p+TKc2tS/mS94O+AyHnSC7+j1z8eUmEW0HE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OSxmPGqPOMa9lkkgGD9phCh/Aos5vBLSQDEmrfDFQySr7mCtKz7lN3W2QxF1zYZzs
	 D48UdfFqacNQyuGQgksBPOQiTh5Kx/ZHzfTdwJz8jMFbLPAXdoKWRmUhPul1Auea1Y
	 +nyyBPEyamnrrwuHXUzL40e7/iBkbSi4AAvkH+pjzELQeKh52mSD+K8ayNeUxEYnLY
	 Q5A6BuPDCwhWSCqUbaFWElrMlTuCXXdrIHWh2SnY8dcQMerjDxcB6Gwx7cZabkIn0B
	 962bORAIIh0Tgr1kpjbBSVpDpT0QvzYyz9520I/JalBL1tzDGQ1My02vxWv+njpkwI
	 Od+URO1TtlxpQ==
Message-ID: <sashiko-outbox-238824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] media: tegra-vde: Drop warm restart workaround
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artur Kowalski" <arturkow2000@gmail.com>
Cc: mfd@lists.linux.dev, media-ci@linuxtv.org, lee@kernel.org
In-Reply-To: <20261128-t20-soft-reset-v1-4-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
 <20261128-t20-soft-reset-v1-4-0db458c5996b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 15:51:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: tegra-vde: vde->clk leak in tegra_vde_remove() when
  RPM is forbidden
--

commit 2c315ebe0db76f7ab987294827d90193c7a90774
Author: Artur Kowalski <arturkow2000@gmail.com>

media: tegra-vde: Drop warm restart workaround

This commit removes the tegra-vde shutdown callback and changes remove to
runtime-suspend the device instead of leaving the VDE power partition
powered on for warm reboots.

> diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/medi=
a/platform/nvidia/tegra-vde/vde.c
> index 878a5b37846ce..6546959e40694 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/vde.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
> @@ -394,22 +394,10 @@ static void tegra_vde_remove(struct platform_device=
 *pdev)
>  	tegra_vde_v4l2_deinit(vde);
>  	tegra_vde_free_bo(vde->secure_bo);
> =20
> -	/*
> -	 * As it increments RPM usage_count even on errors, we don't need to
> -	 * check the returned code here.
> -	 */
> -	pm_runtime_get_sync(dev);
> -
> +	pm_runtime_suspend(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
> =20
> -	/*
> -	 * Balance RPM state, the VDE power domain is left ON and hardware
> -	 * is clock-gated. It's safe to reboot machine now.
> -	 */
> -	pm_runtime_put_noidle(dev);
> -	clk_disable_unprepare(vde->clk);
> -

[Severity: Medium]
Does removing clk_disable_unprepare(vde->clk) here leak the prepare and
enable counts on vde->clk when runtime PM is forbidden via sysfs
power/control?

When runtime PM is forbidden, dev->power.usage_count is non-zero and the
device is active with vde->clk enabled by tegra_vde_runtime_resume().
Both pm_runtime_suspend() and pm_runtime_dont_use_autosuspend() then
return -EAGAIN without calling tegra_vde_runtime_suspend().  Because
vde->clk is acquired with devm_clk_get(), devres release only calls
clk_put(), leaving vde->clk prepared and enabled as the generic PM domain
detaches and powers off, and leaking an additional reference on each
rebind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-t20-soft-r=
eset-v1-0-0db458c5996b@gmail.com?part=3D4
