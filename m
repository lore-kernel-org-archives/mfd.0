Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9E42586F;
	Tue, 29 Sep 2026 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710424; cv=none; b=WktxL2XtxYLecoXc8xWsMwtgsMmuzCVAubpL5JcM6gBkc3zvwGxL0NaZ2QTlkUCyYr2haCjG9CKXN35xoOiJ9u9sfKiAx57/ZCeI8hvRZbO9Fl1bzZsAbgectHOHqsW5St+qk1YFEU1yc4a4R5ACO3YIKB2lDyN8leqSuThsCTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710424; c=relaxed/simple;
	bh=4oZjMtrFvuzaakE7Q3jujxmdDJHT2LtBE5uYoOpMX4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i0BHcl9f2d0fyiums7nLpUbp7BvUUCNrE6NL5P3j2DA/cN9Zpb8xNtVX1jCsABglbTczF3ApFDRpznIu87yx5XzK4juvMTvmlSmsR17EzxJhINCIWssK10vynINqc5tozgDswz98rta6uMP8CAqAdoHT8uFJJskZ7ayxHV4FhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA2nJ3ul; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA2nJ3ul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB8C1F000FF;
	Tue, 29 Sep 2026 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710422;
	bh=4oZjMtrFvuzaakE7Q3jujxmdDJHT2LtBE5uYoOpMX4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BA2nJ3ula6dacecl3O04Y0QcFEwIEv9Cl5wHJJvv4zpGvYA1bvLmhwCWMTEpx7OfP
	 RiFXhC60LaiaEj2IDaWYpMFtcs9a+3mkVxIWZUp68fmEkupjAZtlOXm32WyeThoxvP
	 39BjhSHs28MWk5HuOzQF8BIndXSrEWM9XP714XCNYoxgI34YsHtvq/AK1DnvE7ofRA
	 dq1fUKGNqyottcHb7vnn2OuJeF8cJ+UzFuGHmYx5w37i4XZSX30rFO1H1pCllg/MW1
	 0a3Mhr9T1V5178LMMY0y5kCruXcWSlVZolIfzpyACFJec3CRwvmW5ZfECNMyVWKCE9
	 9ckP/rLzhYPMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] regulator: dt-bindings: Reference Tegra
 regulator coupling schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260930-ti-tps6586x-v5-2-aac0273b5da3@gmail.com>
References: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
 <20260930-ti-tps6586x-v5-2-aac0273b5da3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:33:42 +0000
Message-Id: <20260929193342.7BB8C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
> Tegra-specific regulator coupling properties. Update their dt bindings
> to reference the shared nvidia,tegra-regulators-coupling.yaml schema.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-ti-tps6586=
x-v5-0-aac0273b5da3@gmail.com?part=3D2

