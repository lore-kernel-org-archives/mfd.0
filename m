Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347821;
	b=XzZNWj9NQSof3BNBWiWuT/AuskUKGdKEYAJeJBhEufMCKqKMGQ2jKQ8ij/4jvoICbsSd
	 dB0/rg03/VO7mOwpW2nOXNretOok/b0xZO3ldKInPMCEo/4O63IwMEXXioyB8Ymh4T7ia
	 Cvv/rWoMIjKBEvDj9K21MhmTFolf6sD7b3WJO4FkZGLnJfK0UR5ZpQ3X4O3i2V2JIvdCy
	 VvWMu65rpKi6GJbTtnnttnZoQ2NTewd2+5t10kqO6rLbHmZtb4+a/3clR3Y5uPg1bh4yn
	 Gee4ySbM5Z5Q15Pcp2CTNFyrtb+3U0g3UJdlLYTsqMYpifWqX1fGHVqXFADtTBYvSCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MsLuA1DGhFpQ+I60qwuzjZIo+eNGuqgYrm6Zk2UNo2g=;
	b=m3lUGyoxD1owxGBYSD+2+7o2jBTjtOK/WyY5n4P6CpCk3Qh2NF6+UusLcGKWJ0pIXb5X
	 +0Wn0+iwbnDjlkB+GsSrUvwVNq2iSHkDt5VlAfQsw4xVMje+X74u71NziV0Hv6P+OwrXQ
	 r78tI0EBhQ+ztRXNHPF6IEJ/vVIQ/wyxSU6ba/S88GoVvdBJQbGzBUTVeuePHx60iTpG9
	 dL3xfVkLL813x0xJTO7r0tEtZk3FEhM7a8FBEf3zL+5lafI8RsYlFomqb0rLtWwOBN0YC
	 QgJJL09+rHRzIMA1sKHODYe3rYWfHSR0+UPm1hedUaBdufZaLCIvA7Z9lSXZq36/hpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu46lNPC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94C606A320
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu46lNPC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C32C1F000C0;
	Sun, 22 Nov 2026 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795347821;
	bh=MsLuA1DGhFpQ+I60qwuzjZIo+eNGuqgYrm6Zk2UNo2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gu46lNPCsOkYS6wibdIAbOm7OamKREKgjbSgrhRVDLjAHGDUvx59DKKmYtCWX9g7i
	 A36JvX2n4+PGgac3TmHNp/PzXsZj0keVbAZD8xCR3zPypqR5Ak5BpsbUjOQJdfCzDx
	 9iMXIJHjvv+gklMeUVfxYgD+GpvHoKmnYGkPC6ttzrq6bOxbQXaHeh6gJZa4he/rLN
	 H34rvUGCo7D04t936WuxYGKgFvhjiAfEsxg24zidbAMr2ju7Gqmv4bh2EdjRQsmPeX
	 chOYmPaAjsyilX2PUdeXgx/Ya2O2vxHdRDRdmvw5OTLY3u1us/QPOtEEj76wZlh1js
	 LijQGuRfGrRgA==
Message-ID: <sashiko-outbox-227908@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: stmpe: Disable regulators on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoran Wang" <wanghr2026@mail.zgclab.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
References: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 11:43:40 +0000
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
- [Low] mfd: stmpe: missing kernel-doc entries for vcc_enabled and
  vio_enabled
--

commit c925d035bc9603ef171daf8a11f3677bd18f43b1
Author: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

mfd: stmpe: Disable regulators on probe failure

This commit registers a devres action to disable the VCC and VIO
regulators on probe failure or device removal, tracking whether each
supply was enabled via new boolean flags on struct stmpe.

> diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
> index 87e29d561e223..eec5fc7950145 100644
> --- a/include/linux/mfd/stmpe.h
> +++ b/include/linux/mfd/stmpe.h
> @@ -122,6 +122,8 @@ struct stmpe_platform_data;
>  struct stmpe {
>  	struct regulator *vcc;
>  	struct regulator *vio;
> +	bool vcc_enabled;
> +	bool vio_enabled;
>  	struct mutex lock;
>  	struct mutex irq_lock;
>  	struct device *dev;

[Severity: Low]
struct stmpe has a kernel-doc comment block above it, so adding
vcc_enabled and vio_enabled without @vcc_enabled and @vio_enabled entries
triggers kernel-doc warnings under W=3D1 builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179534733065.15652.=
3659794654405986240@mail.zgclab.edu.cn?part=3D1
