Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B6D45D1BD;
	Tue,  1 Sep 2026 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292972; cv=none; b=BoTjSkQ4V1aoDlKLGpuf4oa1EP3eFkZNsJlYrTAqJ3pr5gaIyWf0c1wCPV12kStx13PYEzuKJTkC43HO2MudkOA5M9p7T60Zo98l/HaJe+Drn7hMrfdsxe7z+jsxIRm9d9UUe/gbpvKVF1uY395yat0SYvuWcJxjkGx9LZj/2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292972; c=relaxed/simple;
	bh=zOlTO0tudxqMYAfp69c47IV7o+KpuoCdBEEVMRDpIsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIZZuAWl5l9hrzeTefUu30f6Aq3N1GWEjaafEGl8Cuh+XlF4m4usmFVHeAXtCvLIVngRKRCGcsXF6yN59b7XA8go7Z5mrgf47wfZ4DQY7vwCjucLAsq8VJgCGfaakj5N7gzSPrGGYeg7qf282a86ZmXU2wUuWzMC7N+zNFutypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtvcgeNx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtvcgeNx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E8A1F000E9;
	Tue,  1 Sep 2026 20:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292963;
	bh=abqe2/0kYH7Ae1GRA1OKsH1oc9ASo0peP0n+9gESdhY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AtvcgeNx90swKHUjrfZemkYua1cOwuwBcjNRDqpVPccYdxBiLSmfkfaVT3AB5KCTX
	 SoHnOsvOTocXBjVTsnwBIJPD03XN1fNMq+ETYmbmOKvRzCo5mDOSN6mZh7MhOezOqU
	 1wq8VqQoqUBxzuV+luG6YssEhniRw/jYHBLN5/kS0hVT1bgTKAMHYa+w0i1yblr9aJ
	 dlJN7oQIKkN/SPsTweGdOF6Ju+nh28QwANmXA/eVGXizVcU73bnW5fHO6BeViTzlzw
	 9fsmknj7zDqbGc4w4UgYkUHNXOBQX4mgEbyn4lHsCykt8jytk54vOzZvpwjpilkoOQ
	 2LfnTYrwDpDTg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:17 +0200
Subject: [PATCH v2 12/13] ARM: dts: ux500: Add new AB8500/AB8505 regulators
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-12-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
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

