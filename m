Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21FB4570E1;
	Tue,  1 Sep 2026 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292935; cv=none; b=cdXrDxCRm/jBfAt2361SyyGBTgi2xSMv3suhU/dJsRRbH+lh6MhsqpPmCG8OI+OZTXo+utajcasV2KABDTKoOcPbNhaSEnHJDIMNrjMRZzE9t+ovfeAK+9lkvb+fE4+7Wka8Pq80PoIEUei8aWU6e1eBQUelbapElYn4jYHZwuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292935; c=relaxed/simple;
	bh=rG+KIn92ie5czVekGzaFpq9mWoO7n+BfszteHjcPnl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VBUJbMeO+apYN6LneEi88YzITb7kXKkjM1UANlN/TLbsrwQWX57hW0SfGMO8Spoa/Dpg2rxsF4Q/s0xmLnDGdh80WaspHc2DL2BtbAEB0+iWcZSvVc5LfRCNVnVf5fdGaLB2WkDgFJS4sjC6lmJerUQp+yE9ok1VzunaKH2HAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSUda7UC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSUda7UC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B891F000E9;
	Tue,  1 Sep 2026 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292932;
	bh=5OuDf05SqTXMns3ClH5tFBIKh25nGgNFQ5iYm4Mk44Q=;
	h=From:Subject:Date:To:Cc;
	b=hSUda7UC9S6HIbqtmwUZDv0GWKfiyzBhi8HuscIjlPneDx5NFB7L1TjxJleaTKppK
	 Vb6vRmwYl8t/ktpnNtzxJ+rHquLZYYkw/GkLtl7RSaVfJwPSyQ/FJQaxm0RI/u+HFA
	 /mvMKCxxCenQyAethu/zdGZka9dJeM7NdTcCNplXtFliZRRjHW3QtnbO2xkxbGDV7V
	 9tGL9SkCCPMYDijTQeRo+RQKly7+2zbR3q0aBikOBjJfhMQaqOhKeR1dqQPmnAiFKc
	 TCiV02KAgmIsxTxWbsZJDSFBy9GMes/0JEH3/N1MBSA+qJ5zCvInAuC8Ve0tbE2wdr
	 2Q0nmzMy7O8cw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 00/13] Add AB8500 buck regulators to the Ux500 device
 tree
Date: Tue, 01 Sep 2026 22:02:05 +0200
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQWTumHVJBV97DsAA7hcamNS0gh
 nB3K3Ht8n+ZfLNC4mg5waVYIfJskw0+Bx0KuA+t7xmtzg0k6CRqEjgtSgjUY8Lkw6trncPI/eT
 aMUTsSqWJFHVaVZCJZ2Rjl52/NbkHm/LZe/82y+/6g0v5H54lCjRM1dkYo1jW1wdHz+4YYg/Nt
 m0fNLpZRskAAAA=
X-Change-ID: 20260820-ux500-dts-snowball-regulator-b35d2252bd57
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

While working on the Ux500 power domains it became apparent that the
device trees were using the DB8500 power-domain regulator for supplies
which actually come from buck converters in the AB8500 PMIC.

First: fix a bunch of bugs. All of these patches have Fixes: tags.
I do not consider any of them urgent or regressions, they can just
be queued in front of the new functionality.

Move some regulators over to using linear ranges before adding new
stuff since linear ranges are nice.

Add bindings and regulator driver support for the six SMPS1, SMPS2,
SMPS3, ARM, APE and MOD buck converters. Instantiate the regulators for
both AB8500 and AB8505, where the corresponding rails are named VSMPSA,
VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM, and connect existing consumers
to the correct SMPS2/VSMPSB supply.

The driver follows the active hardware selector, including the
additional AB8505 selector banks, and uses the variant-specific VARM
voltage encoding. It provides enable and low-power mode control for the
three peripheral bucks while leaving the SoC-controlled rails
voltage-only.

Since peripheral buck enable state is programmed by OTP and can power
discrete components outside the device tree, preserve any rail which
the OTP leaves enabled when regulator constraints are completed.

The last two patches adding device tree changes I will queue myself
in the ux500 tree. The rest should go into the regulator tree.

Maybe Lee can ack the binding patch once the DT maintainers are happy
so Mark can merge that with the rest?

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Pick up Conor's ACK.
- Fix some terminology and clarify the DT bindings a bit.
- Link to v1: https://lore.kernel.org/r/20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org

---
Linus Walleij (13):
      regulator: ab8500: Fix AB8505 VANA voltage selectors
      regulator: ab8500: Add AB8505 VAUX3 3.05 V setting
      regulator: ab8500: Handle AB8505 VINTCORE selector 7
      regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
      regulator: ab8500: Test dedicated enable bits only
      regulator: ab8500: Propagate mode enable read errors
      regulator: ab8500: Use linear ranges for LDO voltages
      dt-bindings: mfd: ab8500: Add regulators
      regulator: ab8500: Add buck converter support
      regulator: ab8500: Preserve OTP-enabled buck regulators
      regulator: ab8500: Use scoped guard for shared mode mutex
      ARM: dts: ux500: Add new AB8500/AB8505 regulators
      ARM: dts: ux500: Fix up regulator assignments

 .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 122 +++-
 arch/arm/boot/dts/st/ste-ab8500.dtsi               |  28 +-
 arch/arm/boot/dts/st/ste-ab8505.dtsi               |  28 +-
 arch/arm/boot/dts/st/ste-href-stuib.dtsi           |   8 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi   |  14 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi   |  10 +-
 arch/arm/boot/dts/st/ste-href.dtsi                 |   2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              |  10 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |   4 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |   2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |   4 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |   4 +-
 drivers/regulator/ab8500.c                         | 748 +++++++++++++++++++--
 13 files changed, 882 insertions(+), 102 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260820-ux500-dts-snowball-regulator-b35d2252bd57

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

