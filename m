Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE6562602;
	Tue,  8 Sep 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873325; cv=none; b=tkR3Aq+jMY5H1EMbnRpiBtTsrpaidgSiAq3oAum7xRCmMFFVuxfa0xUUPS08Jech2kerKn0Ev0xScfOBI3BTbJpH2f6hAS5yw7XRY44HsrtQIVqZ97FdKILqkbPeVIyP72O/lNQpnWPIe6llcH12hnCfaUfliaWHGy6rQkw1YKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873325; c=relaxed/simple;
	bh=K7DHvHc0HwijZTER8bhdqXx/zU9weKcIOT8v6cie5z0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b3MnQE9J8D5zavmxMPEGjuYJTEsw0CPLcRV8d8+VGIl8hMCEVruFE3WLLKBR5z+yxNP7tuOUjxHr4KIjeKK0ZQ1G7F0z3rh2In5ejOr2oM0KKkRWgDknog6ibS/tqOoBx5I6EWIO41serirSWJpaRl0MU+YYVBYB05gWqkEVJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsxGjmY+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsxGjmY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475D41F00A3D;
	Tue,  8 Sep 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788873322;
	bh=K7DHvHc0HwijZTER8bhdqXx/zU9weKcIOT8v6cie5z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsxGjmY+4ocmPlzgIrtcaMiKGltVdvZ6HHsIsjxaNGioHrFRZxsfOuNXBZoL7xBpH
	 YZr1BcgEU4MzjGjBj8N3vGrJtF+dghq6hL7tJmAlRcL9+NrA8DtdFmRhcvW/D14uXw
	 CdT7rl8xcyVC3se1Ka0vj0drFWg6/i9lN/WDFz5cfv0tfFQbEiUXFHPeTQmkoYnnaO
	 tzaI8ImoFQn4Nr1cm1Q/RLjsgHaZTqbBTiNKeFhYjRuFFloFw+8CsZ/6FdpoBEUgQy
	 wy1Nd1qZx12xAaSgi58c+nwWPszZpSaBSSIc8pd3tqFp5tPruPaSy+hHMncsqtZ5Kr
	 sFl4LOVHfAT7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260908130745.2545-3-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <20260908130745.2545-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 13:15:21 +0000
Message-Id: <20260908131522.475D41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.
--

commit 18efba6bffe886fb1172493d0880293e52f677a5
Author: Oleg Keri <okerixx@gmail.com>

mfd: qcom-pm8008: support PMICs with no interrupt line

This commit updates the qcom-pm8008 driver to allow probing PMICs without an
interrupt line. It skips IRQ chip registration if the interrupt is absent a=
nd
registers only the regulator cell, since the temperature alarm and GPIO cel=
ls
require an IRQ domain.

> mfd: qcom-pm8008: support PMICs with no interrupt line

[Severity: Low]
This isn't a bug, but does this commit message subject line follow the MFD
subsystem formatting guidelines? The documentation requires capitalizing the
description after the subsystem prefix, so "support" should likely be chang=
ed
to "Support".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908130745.2545=
-1-okerixx@gmail.com?part=3D2
