Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89CD2D0C9D;
	Sun, 30 Aug 2026 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130254; cv=none; b=nosxSJF64m8KkaQHtPSGl5rIydzDuCRDR690gjPchMGAbfmbjhgX/g7tt3I5aaFjMP+x4bC8B05DZTrgX5R1ciGKvqbnZkfbZhVqxyw/wcoch0E+flABCnkJuqSfkpo9TqWBIe+KT2tEJ2ZaVqMpkXr1C2TH8Zg1s1j+0Vb69lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130254; c=relaxed/simple;
	bh=I2QrDj/K2ZkMGEsn7N/u5lgJMn7eRBv/Iz3t/8pxsxw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hx0S2oEANDAVkb3SvaNgS78znScc63riu4FSZp4sde5ZXLIYui/O31N0XKSiwEXYygh9f2vFxGiZD5XXIwQyVmeI6u3V2B/Bj3yPxQyt1Hjg7/VRhl4JM+DKjgFYVAxo/HdSZBcqDeC6N7z5mZHHgVW2O74LccA8EHZdV+2J0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkkKaA0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkkKaA0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469CC1F000E9;
	Sun, 30 Aug 2026 22:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130252;
	bh=I2QrDj/K2ZkMGEsn7N/u5lgJMn7eRBv/Iz3t/8pxsxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OkkKaA0O2JM0itkJsx0Yr6x6EL0qPqwEBMz3W1GMa7XTo46ItV19GAyIBz8q8wqGX
	 BENtjd8v0QO9KG1Drvc7QTQckNTE8Tvjl6PToKuQ0LnSxikuCv1eA+Fg3JxvO2VNYf
	 m047dL2tG0ufsOXr1/CmSRYdXv7UPf4Z/HoKhC6IsB4/RFBuoWJ8cpfrJILF6Z+tEt
	 hzDOBTsDx8bd47QSdT+xOC8O8gODrlUxMMUB7WPpXsRN1J6lMoIGVArqQNOMEZYeK5
	 EprK6UrgOvqor1AVni7qffAAJw3EkHEVhGMSYYqDGwPgTemNKAibfvTT6vNFnxatpM
	 yqq1r/6PgUu+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/13] regulator: ab8500: Add buck converter support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-9-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-9-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:50:51 +0000
Message-Id: <20260830225052.469CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Register the SMPS1, SMPS2, SMPS3, ARM, APE and MOD buck converters on
> AB8500 and the VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM buck
> converters on AB8505 so that the new device tree nodes can supply
> consumers. Match each variant through its own device tree node names.
>=20
> AB8500 SMPS3 supplies Vsafe and AB8505 VSAFE occupies the corresponding
> control and selector registers at 0x0405 and 0x041b through 0x041d.
> AB8500 VAPE and AB8505 VSMPSC instead use 0x0402 and the 0x040e through
> 0x0410 selector registers. Keep separate AB8505 regulator descriptors
> and identifiers so these variant-specific rails are not conflated.
>=20
> Describe the hardware selector ranges and follow the selector-control
> registers when reading or changing voltage. This accounts for AB8505
> using Sel2 after reset, its additional selector registers and its
> separate 7-bit VARM range. Use the AB8500-compatible and low-range OTP
> profiles found on the supported platforms for the other rails.
>=20
> SMPS1 through SMPS3 and VSMPSA, VSMPSB and VSAFE also expose enable and
> low-power mode control. Keep the ARM, APE, MOD, VARM, VSMPSC and VSMPSM
> rails voltage-only since their on/off state is managed with the SoC.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D9

