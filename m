Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84F455172;
	Wed,  5 Aug 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932853; cv=none; b=seUm9ywNYngYwLT2g1AvkCDmmWiy2P3Cr5NNw48Werl4v3K+GsOO6+xGptp1z51vg2zirRtANBl56i3gwKMIb38RqJHXSOePte8YKHjf/Tuiycx4ae5a8FFVHMql9s3AiKGTx/gLZtD8Dnra5YYjQPVbQrP37atIW82u1CfMSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932853; c=relaxed/simple;
	bh=ZKXGtDRgrDZEmfVw5XB5hocKXEQL/CLwH3Ci5ebQuPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jehHlYSLoZKmPeEroB1eV0q/0jqqG2GmAbtLDaQ6mZYQ9OsFHYtqnFOdwc0sXNHZKh2+JvL8Z0ouA6eylZKFYVlpxP+bhwRgPwwjD+9MgrtvC8zCgZhvSNRoqqQQJGv39WQqX+NHqeiKmZRujVcHGYLwj2klA5lQPFrbW3Ix9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZumJMa4f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZumJMa4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF111F000E9;
	Wed,  5 Aug 2026 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785932852;
	bh=8LFhG+RVl+TzFLNrQnZhq3FHgtxfQz2CQ+fIeVBw7Og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZumJMa4fgN9Ysr4ZCxHNNxou1Mu3V30rgkWtgy3XlcvNu7h5bPuDOuPxrS4ZV984m
	 Q6JOCuWGCrInxigmgCsoDKzquAGIQDuwbgYvPHtKjsxZ3NvYLV5O7MMjKTvGCb03H3
	 VtxFDBEOjg2IaEx+RTQj3LtTZDTNPvNcQGDaPgrfx0RghhVv/l8nNW6MuxTybR0lsq
	 roFB37PHN5ixmQxVLXdatssYVH5foHgLJrOMesnss2KBCEhN+et2qnNvTl6aqsbPR3
	 +oKZNifhAyFa1L+SRyNyshC0QhDDRWmZKruvqvfcVBXw4E+8dsLRUWc3mAF/svksnh
	 Ndb7W3ZMhpvhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:27:31 +0000
Message-Id: <20260805122731.DBF111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing probe error path fails to unregister 8250 port and ti=
mer, leading to a Use-After-Free.
--

--- Patch [5]: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible=
 string for ast2600 ---
commit 37accadaaa3a999dc66b41b5254b8c67bb2fec88
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed: g6: Change vuart compatible string for ast2600

Use the ast2600 compatible string to enable specific ast2600 properties,
while keeping the ast2500 compatible string as a fallback.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7e..7c02633f2bd69 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
> =20
>  			vuart1: serial@1e787000 {
> -				compatible =3D "aspeed,ast2500-vuart";
> +				compatible =3D "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

[Severity: High]
This is a pre-existing issue, but does enabling the ast2600-specific path=20
expose a use-after-free during probe failure?

If the newly activated aspeed_ast2600_vuart_over_pci_set_enabled() fails in=
=20
drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe(), the code=
=20
jumps to err_sysfs_remove:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
    err_sysfs_remove:
        sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
        return rc;
}

This error path returns while leaving the 8250 port registered and the time=
r=20
active. The devm-allocated vuart memory is subsequently freed, leaving a=20
dangling pointer.=20

Should this error path also call serial8250_unregister_port() and=20
timer_delete_sync() to prevent a use-after-free if userspace interacts with=
=20
the lingering device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785932211.gi=
t.gregoire.layet@9elements.com?part=3D5
