Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC03C65FD;
	Tue, 18 Aug 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049565; cv=none; b=Y6UlFVUBpc3ObXGO8qfi3KLOmPY0nMdUtxrpNWHkcJLQQxuwzBtA32LUqSfDgSvGA8NeSbR8A95xeImvxSKa70NuLuwnTKvFqbXsLQaAMN5nj31MDRQa6dFpJgO1vE+malYIRjr1pPJofCaSeCwWP1cpreZvOD26CnIf6XSNmJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049565; c=relaxed/simple;
	bh=Hue9XY44uAJ3g2jPbvTcssDaTaGRm/IO3J4RvEngWC0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j+Jzb4kM8pXI+88fcccycOmoz/13gUrD/kAU7VYmwkW4tmUWhUThfmkwHZ2hC/YXxY65I2e+3t5bQud9RngGjkWORbvZtj5EFq19C3w4T2FhX+HutmVBxfcYfiZfnnw5po5kxTho+Hv16PpR8SY7Ty5z21NddajPguM8tSXhYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4Oo/35v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4Oo/35v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37761F000E9;
	Tue, 18 Aug 2026 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049564;
	bh=bEndIbwdq9Pgs4k1f6ULMZCC573uDXwepemP6bgiMW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4Oo/35v23TzxxnLIFIDsOYljriENLQxQ4skWcqKj4FFQCrAunZ6E1bEVg7zmNmmp
	 yy7nm4rrW/RTpPwL86/xVCN6pJoXsWuspIMEL3BWPPjmo0eCh6KybApdGg0OXDt3Qy
	 5SAbGIG51UyWCOdjuUuCfXagxToV2jbukPpss84KtM13Ph8pTbG+eqcjvwzefSjsHP
	 U5RrYAdNzOP0z4dYHmb6EM5pk8E5xAryRRMisVfM1rE6gxzJatjuogUrhal718FbKw
	 234AGtZqVSEaYoDdBmv4JTSLhtU/ep/xQCgg8cSCfD9jAIuRQe5mADVQNYuhZ0Rog6
	 +Ms3ozG0QedTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260818-aspeed-driver-v6-v6-5-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-5-fd7cc0b338ea@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:39:23 +0000
Message-Id: <20260818103923.E37761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch series=
 adds a new failure path that makes it more likely. Missing serial8250_unre=
gister_port() and timer_delete_sync() in the error handling path of aspeed_=
vuart_probe() leads to a use-after-free.
--

--- Patch [5]: [PATCH v6 5/6] ARM: dts: aspeed: g6: Change vuart compatible=
 string for ast2600 ---
commit 0075a2210772d2bff98e062573ee22db87bab4f2
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed: g6: Change vuart compatible string for ast2600

This commit updates the compatible string for the vuart nodes on aspeed-g6 =
to
use the ast2600 compatible string. It retains the ast2500 compatible string
as a fallback, allowing the driver to utilize specific ast2600 properties.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index edf4b74f5aba4..c952e2075b4c8 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
> =20
>  			vuart1: serial@1e787000 {
> -				compatible =3D "aspeed,ast2500-vuart";
> +				compatible =3D "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

[Severity: High]
This isn't a bug introduced by this patch, but changing the compatible
string exposes it by enabling a new failure path. Can this regression lead
to a use-after-free during probe failure?

In drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe(),
using the "aspeed,ast2600-vuart" compatible string enables new initializati=
on
steps, such as aspeed_ast2600_vuart_over_pci_set_enabled(). If this fails,
it jumps to the err_sysfs_remove label:

err_sysfs_remove:
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
	return rc;

Since serial8250_register_8250_port() and timer_setup() were called
earlier in the probe function, returning an error without unregistering
the 8250 port or cleaning up the timer will leave the port registered
with a dangling pointer when the devm-allocated vuart structure is freed.
If accessed by the tty layer or userspace, it will trigger an oops or
kernel panic.

Should the error handling block in aspeed_vuart_probe() be updated to
include serial8250_unregister_port() and timer_delete_sync() before
returning?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-aspeed-dri=
ver-v6-v6-0-fd7cc0b338ea@9elements.com?part=3D5
