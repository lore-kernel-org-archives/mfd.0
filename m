Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED4E2AE76;
	Sun,  2 Aug 2026 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704690; cv=none; b=EH6myIDjh7rAsB3pwKOLODbP1b6wDPGkJAq8BpT1XRzg1drK8NR5cfybJ0+aSkQOMeoJCpSNtN3q5pVHNeUDpk2QhvRewuOzERba2OodJY7A9SC7zQ0oAVJUbal1ayYABAiexVmQcgN0D7Y/fICNQAKobENBcgrxIr+6dwWmT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704690; c=relaxed/simple;
	bh=Fd6w3NdBA4LnGpSfixwWms+QelWob0oCU1MvL5ZO7wk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=As5+hgCN4XtAsQpipUTl2qoAIAoDawPBxMA7y7KqdFl9soVGkj3+sdC0gm8hWf3pjuUX9cnmb5vvUH9P+WDe/kOltb4DDTsxraZn6ke+DbM4c2yacF9HdyJ+ZWEyQpsGGZO25L14K3GkfHz+uczgavPfLgcPfMEzl+yfG7zlS8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9vFDThP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9vFDThP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CC01F000E9;
	Sun,  2 Aug 2026 21:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785704688;
	bh=LQudG167n0KvKaNoDtPMIdupy91Zk5Zg/DIiWK6PMZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9vFDThP+1UuHHX7HUAHB4AWwuP17KS20FQ9oXHFnAn/VVOM7R2Gq1H0MYkRoCC9c
	 ua5fF35FXD0C3Tcn4N8zsCMwkua7G4krtXB6n3sL3BksHdPnOmwoHkT7ye/PhpjFuf
	 zqjzylcz5fFVCjUUE4IdxqtoMFagYbhCqL3y7VnpUXq4RiuPmJtrc/1PdT7yrI4S/L
	 eL7UguYYOfvDwoYAhdoxEl+QJVe9IehOAK9o0MhtdHAh2/CaLBSdOm9+SGJa42pXgY
	 luws+UIWIqy5BfdoZ2Yqu7iBzG3ooqP+wVyFzMQqUrzx8grfb4vsui56fmZEFlD8Zl
	 TSQ865DMpfCWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 11/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, lee@kernel.org
In-Reply-To: <20260802-zx29clk-v9-11-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-11-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 21:04:47 +0000
Message-Id: <20260802210448.47CC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between v9 changelog and driver code regarding removed =
resets.
--

--- Patch [11]: [PATCH v9 11/12] reset: zte: Add a zx297520v3 reset driver =
---
commit eead351b367c470bc2a440f3b28b22580a7eb179
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

reset: zte: Add a zx297520v3 reset driver

This commit adds a new reset driver for the ZTE zx297520v3 SoCs. It manages
the resets for MFD child devices created by the zte-zx297520v3-crm driver.

> diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-z=
te-zx297520v3.c
> new file mode 100644
> index 0000000000000..bc2801d43d10d
> --- /dev/null
> +++ b/drivers/reset/reset-zte-zx297520v3.c

[ ... ]

> +static const struct zte_reset_reg zx297520v3_top_resets[] =3D {

[ ... ]

> +	/* USB reset. 0x84 returns the USB device status (0x1 for HSIC up, 0x2 =
for USB up, but
> +	 * all 3 bits (PCLK, WCLK, PHY) need to be deasserted for the device to=
 report ready.
> +	 * Thus polling the status is the responsibility of the USB PHY driver.
> +	 */
> +	[ZX297520V3_USB_RESET]       =3D { .reg =3D  0x80, .mask =3D BIT(4) | B=
IT(5)   },
> +	[ZX297520V3_HSIC_RESET]      =3D { .reg =3D  0x80, .mask =3D BIT(1) | B=
IT(2)   },
> +};

[Severity: Medium]
The v9 changelog mentions "Remove HSIC and USB PHY resets, the phy driver
will access them through the shared regmap directly", but the USB and HSIC=
=20
resets are still defined in zx297520v3_top_resets here.

Should these definitions be removed to match the changelog and prevent
potential concurrent modifications through the reset API while the PHY driv=
er
accesses them via regmap?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D11
