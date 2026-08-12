Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5439CD1B;
	Wed, 12 Aug 2026 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570654; cv=none; b=JEsuYh2WYLdJM3BkL2A0LDt8X+8K4Y5/ObOrsNfxBObL91iwbpf9nd7vEoimnTwhSTtJXaw5ZFFn8KORkY5u4ST2ef4HH9o3EQ9O4AX6ER8lwSB//2/i09LdyLdeTXSCnFMIHiQvIzcD3PunjMQ9w+6yc5WrH8nWPyQWTrojp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570654; c=relaxed/simple;
	bh=wuQ2e6g857ThcvZmI20uLA/yeylMQJrOcwARW+bbZc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ih3WKf8R9ikjHEpoSd4u0JC2eagUVsAx0mzjfpYtHacNeQ4T4z93sEM4+eCi/UUylTXfJ2OkmVg0ox3z5EJ4OYrZjRgTMrgb0zD1q/IdsE/CCl0pXeWWuUS72rWVs2pV4o0mDW09vZtsm1Cqqb48P6VozXaMmr/fF/HGJUGKZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPFYqSua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPFYqSua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3EC1F000E9;
	Wed, 12 Aug 2026 21:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570653;
	bh=wuQ2e6g857ThcvZmI20uLA/yeylMQJrOcwARW+bbZc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPFYqSua3WFX/Oop1ATdNKrh4hU0EwjXqHDrfSdOUEDzYP6xSkhKaXeBL1XbDU5nQ
	 Z6vjqfmr07HM7Q8hUNuW30YUBpQEJwRPq7/RZdgXn4FQXRzKmPkOhQNzsjyhywbG0e
	 8IGYyZeB5ScEH1xAk2D+IlzsWT/GMgs18uMkR6d87gICUeX0kVLolfk9bMe8hfDadU
	 ipDCCh+Kit+Eh65zfdja5bt2ICsbKM4Km4qU6zFjKmWokDPGKLfVWZJAnL77eJTHJK
	 tnzzC1zpOhxMUnbSqlg+I2R3G5sl8F/Pw4hxUZZoMqfXodLdyjybgIjvnrjj6rNCEN
	 s4jS0AmXvQuWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 3/5] dt-bindings: mfd: x-powers,axp152:
 Document AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260812-axp318-regulator-v6-3-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-3-d6b84b55c000@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 21:37:32 +0000
Message-Id: <20260812213732.EE3EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
> Among a large number of both DCDC and LDO regulators it features the usual
> ADC/IRQ/power key parts.
> Like other recent PMICs, it lacks the DC/DC converter PWM frequency contr=
ol
> register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).
>=20
> Add the new compatible string, and add that to the list of PMICs without
> the PWM frequency property.
> Also add more input supply properties, for the split DCDC and ALDO
> supplies.
> The PMIC features *two* switched outputs, hanging of DCDC1, and the
> manual calls them swout1 and swout2, so follow suit here and add those
> names to the pattern for matching the node names.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-axp318-reg=
ulator-v6-0-d6b84b55c000@baylibre.com?part=3D3

