Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAB02F0661;
	Sun, 30 Aug 2026 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129876; cv=none; b=Qe1sIRpKDHgsTFnTtPm8FE6ccwMqctCcr3FOcdm5CMZ6fmsF3vHWMSzfCc5PKr531HsCbzin7EBUeg+Kudkq/PSirpup/va6oAbX0qMtKGh2IZd4VHxRAhOZ040TsRQdy6KE5Z35m4KnEEwzaFhsk8AHv/fdaC4rFRnKdeUJEMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129876; c=relaxed/simple;
	bh=zOlTO0tudxqMYAfp69c47IV7o+KpuoCdBEEVMRDpIsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J43SZ00HdgQnIj92gm6J+aRxEseSinZg+E2ZgotoGnMqj5QnYYDxkGbfViFGRL+aRevzCXesZXJFCkweXKBrKRaPKo9ryNSeNMWcHr5/VhcV5PRIVcYoMj+h6WCUOYUHeaDaKA1Eae3aFhD6UUZqV+J25AwwFauJJmXPf6StHO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTbLwXeF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTbLwXeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AAA1F00A3D;
	Sun, 30 Aug 2026 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129875;
	bh=abqe2/0kYH7Ae1GRA1OKsH1oc9ASo0peP0n+9gESdhY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WTbLwXeFJsZUzaP37lLjpbiTgVx3HqwmqCxJT6y0i7MpJf4KBhnzSzx8WKNmJozjb
	 pgfXNN5b6WX+H8PTgafAqAPZHoJg0Nz1jP4Gt195gK9kAUFYgwMfhIckI1IzKlO9CU
	 Dnrbi7s/vnC/g7lVe6bBQWxUzcMuvQfnhYDAyhwR5w6el4bhHlndYZ8hDR4yAYfSmJ
	 GbGcx/XpSMy+VQIVQ32WFnX5MCK2iMLO4pMgZL/aDh70nv8UxJHuqr/uqnw8OLzgnk
	 ck9lVh/1j2oJJ/U0JJ0FvkgkYjVtE+KtWwIYN1zRq6AAcP1aZ4rRPz245jrHnPT7Dp
	 U7T5WFD46HFUg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:41 +0200
Subject: [PATCH 12/13] ARM: dts: ux500: Add new AB8500/AB8505 regulators
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-12-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Add the newly supported buck converters to the AB8500 and AB8505 device
tree includes. Use separate, native node names for the AB8500 and AB8505
rails, including the AB8505 VSAFE, VSMPSC and VSMPSM converters.

Give the 1.8 V I/O buck on each variant a common functional label for
board include files which can be combined with either PMIC.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ab8500.dtsi | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/st/ste-ab8505.dtsi | 24 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/ste-ab8500.dtsi
index dd30d08ccb9b..fc9b613547f4 100644
--- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
@@ -360,6 +360,30 @@ ab8500_ldo_dmic_reg: ab8500_ldo_dmic {
 					// supply for U8500 CSI/DSI; VANA LDO
 					ab8500_ldo_ana_reg: ab8500_ldo_ana {
 					};
+
+					// 1.2 V I/O and memory supply for DB8500 and peripherals
+					ab8500_buck_vsmps1: ab8500_buck_smps1 {
+					};
+
+					// 1.8 V I/O and memory supply for DB8500 and peripherals
+					buck_vio18: ab8500_buck_vsmps2: ab8500_buck_smps2 {
+					};
+
+					// DB8500 VSAFE supply for permanent logic and DDR PHY
+					ab8500_buck_vsmps3: ab8500_buck_smps3 {
+					};
+
+					// DB8500 Cortex-A9 supply
+					ab8500_buck_varm: ab8500_buck_arm {
+					};
+
+					// DB8500 APE logic and multimedia accelerator supply
+					ab8500_buck_vape: ab8500_buck_ape {
+					};
+
+					// DB8500 modem subsystem supply
+					ab8500_buck_vmod: ab8500_buck_mod {
+					};
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/st/ste-ab8505.dtsi b/arch/arm/boot/dts/st/ste-ab8505.dtsi
index 131c82508e82..eb25a3f366a4 100644
--- a/arch/arm/boot/dts/st/ste-ab8505.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8505.dtsi
@@ -297,6 +297,30 @@ ab8500_ldo_aux8_reg: ab8500_ldo_aux8 {
 					// supply for U8500 CSI/DSI; VANA LDO
 					ab8500_ldo_ana_reg: ab8500_ldo_ana {
 					};
+
+					// 1.2 V I/O and memory supply for DB8500 and peripherals
+					ab8505_buck_vsmpsa: ab8505_buck_smpsa {
+					};
+
+					// 1.8 V I/O and memory supply for DB8500 and peripherals
+					buck_vio18: ab8505_buck_vsmpsb: ab8505_buck_smpsb {
+					};
+
+					// DB8500 VSAFE supply for permanent logic and DDR PHY
+					ab8505_buck_vsafe: ab8505_buck_safe {
+					};
+
+					// DB8500 Cortex-A9 supply
+					ab8505_buck_varm: ab8505_buck_arm {
+					};
+
+					// DB8500 APE logic and multimedia accelerator supply
+					ab8505_buck_vsmpsc: ab8505_buck_smpsc {
+					};
+
+					// DB8500 modem subsystem supply
+					ab8505_buck_vsmpsm: ab8505_buck_smpsm {
+					};
 				};
 			};
 		};

-- 
2.55.0

