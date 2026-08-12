Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C453B5E07;
	Wed, 12 Aug 2026 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570665; cv=none; b=f3Sk/iBZuu9sWoPbrZKA8VrWqkEpg5HoPJkF6LhHMwJWoh8Kc1A2+xxouk7FzBELvlyXF6mapooaSIF+ewIdtJrdm4aeF23VDPd2mT13wqFDNZd2bonwSXWc5EafZliXNVGYjqrTVaPdKfMPkCMqPab/SxSLvC+ISjBz3rh/xQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570665; c=relaxed/simple;
	bh=OaalBhX1IKVt7VSw41Td40ZnFQ7KZQlr7GWfeqOyFbc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DipK47m3pUxbBsH653uVKav76jZm+LaO5ovsqD2cjVfztMny/KR0ZLXS20vqI0AxY5/97WfZUelF/Y0hl0RfrDRLZ19Kyrok/o+PXM1P4qewqTWwGC/hrbT9hd/JLhG781xr7U39U4zfBG502QHhfDHVMtf/kfCTUixhTbBjUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceqRiJHF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceqRiJHF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D124F1F000E9;
	Wed, 12 Aug 2026 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570664;
	bh=OaalBhX1IKVt7VSw41Td40ZnFQ7KZQlr7GWfeqOyFbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ceqRiJHFdz4k0mEUnxFPbnkgwbQ0wtFL5TNNnTK2r56NAg+wgzyD9hZegc6L282Wk
	 OuMJbfy2AP0Y7rHsiB26fQZ520BOK5n9I7VAF9MCTa9g3l085mH4tirVp7baajqNK6
	 UBy603fzvvX+VicOhpQMK4FogRmyAPF0beV3TDCvskcmBhAqtdHyaMreY/B7zpAxlt
	 aMalxRQAD+TPQqyjvom9csP0kwTg/kVQYA7ggbNWjvzvHcE8jwSReClprPwYxa86nV
	 AL94awUnN7qyIVsWZBJtDDxpTuZxQQ69nI93XYZFlzelj0Zj86ufhIxTjxQVw3E2HE
	 dSgh2h8zU2MrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 5/5] regulator: axp20x: add support for the
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260812-axp318-regulator-v6-5-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-5-d6b84b55c000@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 21:37:43 +0000
Message-Id: <20260812213743.D124F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
> DC/DC converters and 28 LDOs, on the regulator side.
>=20
> Describe the chip's voltage settings and switch registers, how the
> voltages are encoded, and connect this to the MFD device via its
> regulator ID.
> We use just "318" for the internal identifiers, for easier typing and
> less churn. If something else other than the "AXP318W" shows up, that's
> an easy change, externally visible strings carry the additional letter
> already.
>=20
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-axp318-reg=
ulator-v6-0-d6b84b55c000@baylibre.com?part=3D5

