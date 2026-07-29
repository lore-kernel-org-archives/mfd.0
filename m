Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1BC30EF63;
	Wed, 29 Jul 2026 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345398; cv=none; b=BDOCioehycUo0WYxQWK8KHIjXHyGfLsRAv1/AHPotvZXEzMBEmu9/Iq/t9oZ5kJPzEBFQOISTgx6mfWCgHhIAGNaLEc/md0IQqAUT0G8n2qiX8CIMAD06hW3J3HYIhKLjIWwBzU/eQcUtKc8pgVn8U4cDuRbFj5E9T1xIuoyMwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345398; c=relaxed/simple;
	bh=ca5AssLueJYRcHcoZRG+XR+L6Dy2r4u9T2F+Ksu+i0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JeEbCWB1y27NauBA9C6vPJFG1/A/aASqvf/P8sFExKRCy7FMT3rwxD6ukE7efUSe+6Uch0AvE3fqTACCbaqpaV22Jb/nrEn95+VxvL+uavVZ7kavTFHzu3VCn46UWaQjwaObZyxboahLqI+nSGCc2xiwuGYmwMC36uT0tGgRIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsEssePG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsEssePG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56181F00A3A;
	Wed, 29 Jul 2026 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345397;
	bh=ca5AssLueJYRcHcoZRG+XR+L6Dy2r4u9T2F+Ksu+i0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsEssePGEGkTPBxCG8/96R4d7ygUGMaP2hcV5wUdBb1J2fHO1xidSJ/8tKpPEco9C
	 ocAqzdCdSffHv9vnGXZHUoxxtGDK2WgkmydeP4CojbznMvRjRiPytMWwTV73ldUzC5
	 tJXh6Y3YXGG+QQpuoP0VHsF7k62GBmQTjETY0z9uNLutLCoD0h8UqrjSHCCoUv2nUc
	 XrPYalSSCin6VVb75DBARpKIlAtAcrMBpYO0wy6r/mixQOHkTAN/UeZLKMLolh6Zrf
	 VOU1AhW3EBdD7PqNr4J1wnu6brUm+7Sr9PQJlNF5oSS1bKx88pLa/SMaGkhl1SCnAu
	 0kOSChrYPo2Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 05/10] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728154846.1828945-6-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:36 +0000
Message-Id: <20260729171636.C56181F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unintended register overwrites using `phy_write_mmd` clobbers conf=
igurations for Gigabit pairs B and D.
- [High] Premature exposure of the network device to userspace and broken p=
robe deferral due to requesting NVMEM cells in `config_init` instead of `pr=
obe`.
- [Medium] TX resistance calibration enable bits are defined but not set du=
ring calibration, likely causing the hardware to ignore the calibration val=
ues.
- [Medium] The downshift tunable silently ignores the requested count, brea=
king the Ethtool expectation that requested tunable values are enforced.
- [Low] Missing Kconfig dependency on NVMEM causes link errors when the PHY=
 driver is built-in and NVMEM is a module.
- [Low] Multiple register macros contain typos (`R500HM` instead of `R50OHM=
`, `DELKAY` instead of `DELAY`, `SAMNPLE` instead of `SAMPLE`).
--

--- Patch [5]: [PATCH net-next v19 05/10] net: phy: Add Airoha AN8855 Inter=
nal Switch Gigabit PHY ---
Note: Due to system recitation restrictions, I am providing a free-form sum=
mary of the review findings instead of the standard inline-quoted diff form=
at.

Commit: 838a0b60afc5cdb8527d6d477a38318567cda39e
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
Summary: Add support for Airoha AN8855 Internal Switch Gigabit PHY. This is=
 a simple PHY driver to configure and calibrate the PHY for the AN8855 Swit=
ch with the use of NVMEM cells.

[Severity: Low]
In drivers/net/phy/Kconfig, AIR_AN8855_PHY is added without a dependency on=
 NVMEM.

Will this cause a linker error if the PHY driver is built-in (CONFIG_AIR_AN=
8855_PHY=3Dy) and NVMEM is built as a module (CONFIG_NVMEM=3Dm)?=20

It might be safer to add depends on NVMEM || !NVMEM to prevent this linkage=
 mismatch.

[Severity: High]
In drivers/net/phy/air_an8855.c, inside an8855_config_init(), nvmem_cell_re=
ad_u32() is called via an8855_get_r50ohm_val() to fetch calibration data.

Since config_init executes during phy_init_hw(), which typically happens wh=
en the interface is brought up (ndo_open), will this break probe deferral?=
=20

If the NVMEM provider is not yet ready, nvmem_cell_read_u32() will return -=
EPROBE_DEFER. Returning this from an open() syscall prevents the kernel fro=
m properly rescheduling the probe.=20

Should these NVMEM cells be requested and cached earlier during an8855_prob=
e()?

[Severity: Medium]
Also in an8855_config_init(), when applying the calibration data for TX pai=
rs A, B, C, and D using phy_modify_mmd(), the enable bits (such as AN8855_P=
HY_R50OHM_RSEL_TX_A_EN) are not included in the mask or set arguments.

Are these enable bits required by the hardware to apply the calibration?=20

If so, will the hardware ignore the new calibration values because the enab=
le bits are not being asserted?

[Severity: High]
Further down in an8855_config_init(), phy_write_mmd() is used to configure =
AN8855_PHY_TX_PAIR_DLY_SEL_GBE and AN8855_PHY_RXADC_CTRL for pairs A and C.

Because phy_write_mmd() overwrites the entire 16-bit register, does this un=
intentionally zero out the configurations for Gigabit pairs B and D?=20

Since Gigabit Ethernet requires all four pairs, clearing the delay and phas=
e selection for pairs B and D might break link establishment or degrade the=
 signal.=20

Should this use phy_modify_mmd() instead?

[Severity: Medium]
In an8855_set_downshift(), the function accepts a downshift count, but it e=
ntirely ignores the numeric value unless it equals DOWNSHIFT_DEV_DISABLE.

Does this break the ethtool expectation that requested tunable values are s=
trictly enforced?=20

Since an8855_get_downshift() unconditionally returns DOWNSHIFT_DEV_DEFAULT_=
COUNT, subsequent reads won't match the user's setting.=20

Should the driver return -EOPNOTSUPP for unsupported numeric values rather =
than silently ignoring the requested count and returning success?

[Severity: Low]
This isn't a bug, but there are a few typos in the register macro definitio=
ns at the top of drivers/net/phy/air_an8855.c.

AN8855_PHY_R500HM_RSEL_TX_AB uses zeroes instead of the letter O. AN8855_PH=
Y_CR_DA_TX_PAIR_DELKAY_SEL_A_GBE spells DELAY as DELKAY, and AN8855_PHY_RG_=
AD_SAMNPLE_PHSEL_A spells SAMPLE as SAMNPLE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D5
