Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E581A9F85;
	Wed,  5 Aug 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933020; cv=none; b=MXhl+KoApv5R28ineS+TVp2CUv5DNXk93dzmr901suaEUyhsIU/pzby8ZvQC5IxxYlAskwm6vBtax+Y5f7xKx0Y4Tnan9CDpAg+qKeJqa9oxibg6RnHNgX4m7Je7J73ziT42ukgp/Bal3FDQNu96fjBVSMAxzRUVMjq8gt2q7tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933020; c=relaxed/simple;
	bh=XXgnwBsqb8t60M2I79gxkuqRDXt3vC6r08/bEtZkUzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jo08Zs7Ev+ZD/rFPbe8lbB2qOfLXg+yP4CzACVCmhFvYmte3C6mGLFgDorMA0Q6KkmURsUhmNXUAjAktq0bwUjXDo/KVLzk7VUGXHNguUwepSq/nXhJhFDsBJqPKr9ER18cnHRiQi71FTW136DvveDB0kOuf4f1IjDfr3QV5V0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agKAO4fj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agKAO4fj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135281F000E9;
	Wed,  5 Aug 2026 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933018;
	bh=bFQ/oevoSaISZmQwFhtnDGf1LrvHJf/k3MOTF2EPIjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agKAO4fjFCUYnodqhjAJxMeMpOQ3AHq9JHuI17nrp6qMS/Vl0BFGTiL/5ceQTaspS
	 yVDS3/XVTIxvtv6N9Nd+phCF7FiB8Mkzyz6oOlD0rEFkYuuKMThvSbjZxnHi+ZAPop
	 xWPUlXqtvhcdZ22gAVmC3ywy1e9lt0Uiu35+gIft3xAwrMDiQ5KvW6nxgh6OyvcJcm
	 0MITvD1WrKXARBDDt+NFjv9KTQQV9RoUcfF9FeyAwyL3kbP4QV0uYC+4iJl70XmJIC
	 eIcj2hxFwsJ2bchGa4GdqepYzO2mL2+I021zdanOkS5OZ8PYhjeXlGiUlxjr8w3alZ
	 HlLrYjKVz0ljw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:30:17 +0000
Message-Id: <20260805123018.135281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing error cleanup in `aspeed_vuart_probe` leads to a dangling =
8250 port and use-after-free on probe failure.
--

--- Patch [6]: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-p=
ci prop to vuart3 and 4 ---
commit 373b41ed9602ed016ca9e86ec139c751e10daac0
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 7c02633f2bd69..fbd7ab6332a1e 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
>  				reg-shift =3D <2>;
>  				interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&syscon ASPEED_CLK_APB2>;
> +				aspeed,scu-syscon =3D <&syscon>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;

[Severity: High]
This is a pre-existing issue, but does enabling this property expose a miss=
ing
error cleanup path in the driver?

If a probe failure occurs in drivers/tty/serial/8250/8250_aspeed_vuart.c
after the port is registered (for example, if setting up the vuart-over-pci
functionality fails), the error path skips unregistering the 8250 port:

aspeed_vuart_probe() {
    ...
err_sysfs_remove:
    sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
    return rc;
}

Does this leave the registered port alive while its private data is freed by
the devres framework?

If the port later handles an interrupt via aspeed_vuart_handle_irq() or is
accessed, could it dereference the freed memory and cause a use-after-free
crash?

Would it be safer to ensure serial8250_unregister_port() is called in this
error path?

>  				status =3D "disabled";
>  			};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785932211.gi=
t.gregoire.layet@9elements.com?part=3D6
