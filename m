Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB1455173;
	Tue, 18 Aug 2026 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049979; cv=none; b=ezI2F6F7AP9q0VctAu6KkPCwr4dDgFn8pQp9VZPQbyIpofEfIfZ740ravl/1AoEu9/aO9asULUF2a1H50yamZVkiEFbJbwkl+1un/aVYg/WNAWKS8ci77wosefrSYq2KwaETNTt4jzBuqtGCc/UsEyiOMaq/2E5zuWo6a16wd2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049979; c=relaxed/simple;
	bh=g1b9527SDpeQyixoHTZh2Q7ItzmT7ibzmDbj8Zfg2nk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RPtxpsq45QXXBPIFZBnt8Z27ax7gS7WM/ZLlAGdFWPg6E0G8UuH+RvjeuVOhsGJwTt3EESOnlC076OT9Me1G2f0qi6aJ20Wq7U7HZn2ljzKACO2TALmeulhFuYVWTKBWjOqWRQPNh1RymrHSM6K7i1Be9GtipEiJWCvzd2Zf5Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H21eBYcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H21eBYcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722651F000E9;
	Tue, 18 Aug 2026 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049977;
	bh=CUXb6f22ou1etZJTxH3TzNgrYznocVHE4GPYsgkV5WA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H21eBYcr5d6UqdgoA7Wny/YHeci2IsSDSZcrlrJnFUV0C2mN5QsF0/MVPsjlUs65S
	 U5OIivUt9WIS83y1VM6iul1jsaIijc9PxR5yldDW5YnEpRhtzGSaw/AwE8wCsgMgfA
	 TL1gqCutgYtG0BRWR0kVfAVNe0cCL4k3dlWqLMtokFBKGzIaagfr7W0/QKiF7pq7It
	 0Mu7rM5VPYb3Mhb2FSf7M2zWA9PRmme+FgEkRNl/ngeUIK9RTL/Q9HJ0VQpJ5cegj3
	 njLQOfpud8e7vTaiLblJhFi0H8lOI2VoSrLYavY9IxBN0cqQlf1i35oOP7O+uluZ9U
	 Xzb7P3mCZ+Bww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:46:17 +0000
Message-Id: <20260818104617.722651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing 8250 port unregistration on the probe error path leads to =
a Use-After-Free of the `vuart` structure.
--

--- Patch [6]: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-p=
ci prop to vuart3 and 4 ---
commit f96d2931c661be3250c723d0a37aa6edf52c56a7
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the scu-syscon phandle.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index c952e2075b4c8..61cdca0b3ed7e 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -723,6 +723,9 @@ vuart3: serial@1e787800 {
>  				interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&syscon ASPEED_CLK_APB2>;
>  				no-loopback-test;
> +				aspeed,scu-syscon =3D <&syscon>;
> +				aspeed,vuart-over-pci;

[Severity: High]
This is a pre-existing issue, but does adding these properties expose a
memory corruption risk during probe failures?

In drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe(), if the
function fails after serial8250_register_8250_port() is called (for example,
if handling the newly added vuart-over-pci properties fails), it jumps
to the error path:

err_sysfs_remove:
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
	return rc;

This skips calling serial8250_unregister_port() and timer_delete_sync(),
leaving the port registered. Because returning an error causes devres to fr=
ee
the vuart structure, could a subsequent open of the leaked port cause
aspeed_vuart_startup() to dereference the freed vuart pointer?

> +
>  				status =3D "disabled";
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-aspeed-dri=
ver-v6-v6-0-fd7cc0b338ea@9elements.com?part=3D6
