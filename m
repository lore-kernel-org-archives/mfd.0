Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8704F472D
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564349; cv=none; b=U0YPfB/fCjbWf+dzasiylDFjs1R58veyDXSrpY+PXHIHVJmyK3iIscDRSGADakC9r7BQM2HBMv9hLfPgBP0vvNgUI2XAemYXyPqlHYOPJAiz8yQzIE7Ly0NrQrtZd47XU/ZVNuGHAYM4onc2JgwEa8Hf+HH+CDGHISaA9JJu8qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564349; c=relaxed/simple;
	bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dnHgveNApztWzEsmywQyMy2976qsjoF2l7S8or/hXDvMc1xm00eyTOy/8QXxIX77VNMA2M9wQHoS4x31wgmUs/1vNyO8g8E+TDonx7FnZvOdGBok/Ax6w+kLvR1q42My569Nd9gwYOtnGT64gm/jVjGsKYa3UCe1wQz8wG1jNsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QO0RQG7A; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO0RQG7A"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab18b3e6so87085a12.1
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564347; x=1790169147; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=QO0RQG7AaikRAXgyKUD3eVMvg+9heZpJnFKPVYmlzKsOo0Z84/SSjPXUJOBw0Kcif3
         PXqH4TAKSMOVMbk9zZ2L8p+2jlbdnw+0RLgGan/1CIOIr68T4z0dZzZtOQ/XznAvH2V9
         nS/QyNRLahR/Kh3SOnFIMnQkdcLYhx/fnB0q1iLnA7IaD2q6pSPWQnzr2iQvmtUzlo0n
         J82bhjCxIcR4fw8cxTKNmgHA2nqJcg3u+EiBHpf+F4/A5rE45IMpkTfxa+euzr8nfMwF
         OuFquazA1Py21mijZXeXqXQ95TBMJOe7oDebBGe9lJ3vNsT/FpGZzLb9Sl9ipmjYYV1/
         4ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564347; x=1790169147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=pNjjlt1farPRVXvS4XTPLRgdJRnkUlLQhP7htcR0P/7j1+OL3Uz1P3ISEXsJ2vd6cA
         RcZsD4fP9iso5KEx2N+slhjTQ5o3phaS0D8xDnFDOH5XN5S0Cq/2e+PYOHFmhyFXUCG5
         Uj5iggTKTDe69X1HwiOwEjA51cKiD4VfXkEQDa9+43HAOe0T/GwmVITPsJi/eTo9zkMd
         4gzxVU6z4uY/b6Fbq2qBSQZS2AiYsOWIWoAGqtuMdcLnw1EWyZaziLumwNKjwylRFAE9
         U21M2TzYizvr5tiCZeOM0jjtP/8i9qbtjutYYrW67h6iUL0O+CcQTvtB/aNE4QhgC+Dd
         9c3g==
X-Forwarded-Encrypted: i=1; AKwUvBzvRZlQcOdeCjHZLd3mYzEjqggQNGW4GqWOYClRCY4E6/vw8AS0INXPszb+EDf7kRJMAbQ=@lists.linux.dev
X-Gm-Message-State: AFuF++k8wUxEKSQ5N3/+zXmX3A/fD2z+S+mm1cXTvUvKeNC34zYkcfxi
	B0jLHsvsDvw5tJmXysC+7KCj7JOO8xHbkQ9vkRoFvZzei/YglZCLoOK5
X-Gm-Gg: AYBFou2cIiipcgyAVgxHD+Rd4WF+pZ89Cw6qCJgYubQmtBNfKcjhXrKCyT1WO41XhtD
	ke7MBC8YNmvyyQTfBeDN3/lqAfNqhHTjSopE3xWsnEPcH7YywLQLmjM0AcvWLJh5q1W4HeBKVr8
	qeaMzsdRSqD65biW76X4qGS2iAtgkztHJap3YZOmNYPkC6OEVIyrG/UVHdwXx1UYOk1myxQt6vs
	y4NJxzLoBIw0qiwAC3ngLmQPKDh6nf1V0lqp9C2UYlzBVxVKw2MeVmYgA8nWwwvpMPxWk+Iiw/Z
	KoPOUzerXgloB73QTbQujpu2fj3DZghH67jOWrAyX3THmNkP4VF4MCzWd53I0Apx7a5hQ29ccAN
	izZAplE9Y8NPkpYXbm3Ig95IOr0I3xSmqg3A03MrQy0Q8K61hVveqda2S6mNSjC2Cwsd6tT6yGP
	fQ7lZz724EKppj3dQ3WXqHsVYSQ4jyq+OZPFTWFZ4oKPUWiqW+w2kSp9mzG6khsCKdxRg5Rk3NK
	J8n2kV9714=
X-Received: by 2002:a17:90b:3985:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-39e1e5b05c4mr3774510a91.6.1789564346731;
        Wed, 16 Sep 2026 06:12:26 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:12:25 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/4] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Wed, 16 Sep 2026 18:41:25 +0530
Message-Id: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbQ0zQAFX3sOwoHWEMQqkrQRDu
 LuAceHyJe+/P4NnJ+zhFM3geBQvfbcCHSKwbd01rOS6MlBMOi4IVRAVBq+zQk/KZCnniFhibmF
 dDI5vMu21S/Vl/zJ3tmFLbEYrPvTuvd+NuHm/Mv2VR1SoysSaVJuEDOXn5lnL42j7J1TLsnwAk
 5/tUrgAAAA=
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=1796;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
 b=2ye56ypaFgSH7USqMbWUuVvBf/TDHcEaDTrhnaB8zVgFJwMnkcAVhyAStEA2IYP3R4D0er4WJ
 4KsDh6SANL/Bmvb3BCoGm4UqBId3woAO+8sopOPJOkUBNAh96A5cHV2
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (4):
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  20 ++-
 .../regulator/maxim,max77620-regulator.yaml        |   5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 -------
 .../nvidia,tegra-regulators-coupling.yaml          |  76 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 294 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

