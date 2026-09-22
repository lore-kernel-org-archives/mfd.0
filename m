Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77F434408;
	Tue, 22 Sep 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074561; cv=none; b=WLsOMANOroh2oPwknuGfCFDmFUhDg+cf4ZbCdp+FeUVlAQckDyAtjQkNfrvDujRi/1n6PT+CXCEqebBPi/44YWKz0ktwb9kCKhHxsLAUIxerdIRqB+I0MO3ECL9WOD/x0Hi4+BwDE5dgCSGiEn5n1l6BIL7Kc31tVcFiTvp0qDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074561; c=relaxed/simple;
	bh=uYy1nJrVRhAPk3LFQ1c2BfYQ+QXVu1yQPw7J7FBSCiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hgS0g3beklxM1W3yjhXwo6i3NiHSUsSVGxhduRw5WGKf0cNj8qYLYstZY0J0/fs7QEs5KoFSkbFjEwswqY7OgRdHCcX7mqz2Q4cS1f1lnV4syFdgLPGWAQcmr5mi2c3fuT80+Q7KBshyuZoI2VhGGgbgLK2wwmA+Dtcyw47Zxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RORMbBMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RORMbBMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DE61F000FF;
	Tue, 22 Sep 2026 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074551;
	bh=WjZJYL0KSzKkxVJs6Abzz+ePqx/kRAYd3uRB5n+/G10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RORMbBMIr/BUpUTUW/4uIAeYN+e5LOzFVYHaGfXL61ggdGUZlSEQB++KKikJq585V
	 SAkSgXwcBdVaomHbpszt9qN6kfQ11mY9eHVWqmt/mYgqsLbUNzmwGhoQpUa8U0wdAQ
	 a/qDk+jAMPmmBFOIqe8nvytJjKHeSmoec4wZg8lIfrULNlkbYrQmj++LYzv/S0cIgt
	 l+qLB2234LgvsAxekxUIHACK2ypA4hrvb0OjoI0aeFPLpJBbqY+KgtnaoLQm1NEi4q
	 QWF4Irksw2+FpA5pJiwh70y23TcB20hOikig0rcoh/lDY4molLEpuzRd7u9LF+bsUR
	 dSQ3kzplIY24Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, lee@kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922103551.2754613-9-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:55:50 +0000
Message-Id: <20260922105550.B4DE61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] i3c: hub: race condition in W1C register drops SMBus packets on =
overflow
--

commit c3c584227ca9aea44ff10ea314eddee7cc1ae7a9
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

This commit adds SMBus slave mode support for the P3H2x4x hub SMBus target
ports, allowing it to receive downstream payloads and report them via IBI.
The payloads are then forwarded to the registered I2C slave client.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index a3324cc365956..7fdfa79dfeb6c 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> @@ -15,6 +17,178 @@ enum p3h2x4x_smbus_desc_idx {
[ ... ]
> +		case P3H2X4X_TARGET_BUF_OVRFL_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     P3H2X4X_TARGET_BUF_OVRFL);

[Severity: Medium]
Does this write clear newly received packets on overflow?

If an external device sends a burst of packets, causing an overflow (bits 1=
, 2,
and 3 set in the status register), the IBI handler reads buffer 0 (which cl=
ears
bit 1 via a Write-1-to-Clear) and buffer 1 (which clears bit 2).

If the hardware receives a new packet into buffer 0 in the small window bef=
ore
the overflow flag is cleared, bit 1 is set again by the hardware. The driver
then executes the regmap_write() to clear the overflow state.

Because P3H2X4X_TARGET_BUF_OVRFL is defined as GENMASK(3, 1), it writes '1'=
 to
bits 1, 2, and 3. Since the register uses W1C semantics, this second write
inadvertently clears the newly set bit 1, permanently dropping the new pack=
et
without reading it.

> +			dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
> +			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D8
