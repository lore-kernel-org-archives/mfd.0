Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE624CA79E
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405083; cv=none; b=LQdZiHAsV5UiljFjetaruVOokJEqWdr1wh2Yq0df/mvmvGZhgGgGJneIhL9z92a4duXvTvSaQbFrDxSY58b5p7QAvQDcNwma31fwUMtNTsH3xiLcJHHBYEHZqsZC3otXId2mZsEwsgjy0uHa85xiQ6keILEb6vzWW8bSKQP8WZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405083; c=relaxed/simple;
	bh=J1xxRqlBh7boJ6+AATu8v1xS5H4zsaNU7gAePP3DFLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odquUGhmf28HNjXowOWuK5PFz9CzRYEiBEcbSc1snaqLOgxTMP4vESgbbbpvtz68REuddp0+mlgchLQSIS8tWsd7+870/yZ9dz00mK0H+epvPDzyXCSbiUbhI0W4/L2ZdXnhy1FYjtp0JUJ187jqq3VdDP+JLgPtR8P1Q8fkNJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NV0oS9M1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NV0oS9M1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso939460f8f.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405080; x=1793009880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQDkoaUO+6d9gZ51Qs77Gmj3Sntv3TlySXyax0SSKL0=;
        b=NV0oS9M1gaFdGFhiSq3aTisFymYzcDrJvctpcqG+QITfodzYn4tLdyWzHjIryGLLG8
         KQET0flLGgMU2xZVUk8/kTyjOVs0bONMzyoAITtrrPK7VY4atPRYTmCIH6bX3jdcx2wC
         tsHxclZvDXhgbdQXPTZo4V89Iah1uo2SSVmBwrQ6F4DPHezqE0N3cvxSDe6079Rpxehw
         o4iSf7DdKCfP+Z2fEPZZlyxIKmXvpah/cFBN4vVUsyicevr6Rs0twbBt5hzZEsBEywnJ
         aKtpDJB+D4Eq4MozlyCdJZVBESvTysg4GRGoLLr2wfWZ8wNbS+8NGRq9qIPjXOy15YsR
         n6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405080; x=1793009880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQDkoaUO+6d9gZ51Qs77Gmj3Sntv3TlySXyax0SSKL0=;
        b=whyBlHxjJNc24JgLr7C4NEGSia2Uh8fxLCd5WYLIf+46M9UZzgGarMuEq6ntf/dzBf
         HJl15mtd/zCiMBKmIBGw8T15wWHwei9uFRLwx/Q2G82zEezOR+smetqCcLHSBevZwx19
         Uuu2BAGbKTzEPtLnIXU4YGK3+g5a2bBplU+0vV2V0BF/HlmN5VvoA5MmeRC+7iV9pj4v
         G8yywrpp4pSm4vN1P/r+fZaEkn5l++j06mRusOy54d5QhNaDk3UUc5NaRWNwv8k0eSPu
         +1IzSyyT7sUNgl6nZdzidIm9C6nsejKRe/lKMplFakHw7Ud5I6pnY3LI3YbRgc7cr/zj
         aQMg==
X-Forwarded-Encrypted: i=1; AKwUvBxh4DHbjo3LkSSYhhZjUAWv0yszoILrhSyz7DwaR1rMrsj2EusPQUr8DFzTlEnah5i00AY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIWq8WwlbtQfe6RWwZ6NmQeWMyI4xd+OYZKfvEgFAEGdjJ57gEf
	fNFSX44UTb2iqRzV6eAZt0zWQ/6uSFV79bz/75EyZ5DFlpsMfgGeSL3l
X-Gm-Gg: AYBFou30m9eG2nBppEuEuJ7cfc+dGajuy0bRqJgpGoPSkXuw7alqLa+6mDepYwXZZKF
	u7nOVds/aR7QSOzDQcoMcPcXF/+HIaVEyEtWlS4DBARvABgevd4pUnSxR9sz28n1okAxZJIhnXi
	SXwqmS1rJg1bo3KeRcIIWsZSFsV/KBW08iwZO7KkTuQJSs/b+B233y67gndYiS1ukvImzLVU37f
	Hx4/2vP7N2awvufvrz3bLtmrg6Mmu75zlb2V8mvwW1vQ2mrBUEES6575OHPEwE3jeaBzQN3j/Fh
	klgYn+RZ3zXDFFBTDeeZgdHHcAksb9iY2hZQELK8/m1pxCHpeazg+ye7ZRC9EdWpe32NswsUNVG
	CBVahhBnbIS2btYS5C2bKiYZvTm0f9XIebgx6G80ibEQunxI6P/PKELeFRctahPz5E6sbmMdmDT
	lxheGuhsw0XhAAg5Am8DbHqAT6yy799oZUlUEIH9GTVPYmmz3wIOjrB6OLnKtZ6Yi3vKm0azOqR
	+47BxIoGOxnI/tdOTw=
X-Received: by 2002:a05:6000:194b:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e07fee915mr8782491f8f.57.1792405080272;
        Mon, 19 Oct 2026 03:18:00 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:17:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 0/4] mfd: max8907: Schema, pdata and poweroff
Date: Mon, 19 Oct 2026 13:17:46 +0300
Message-ID: <20261019101750.125439-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 160 ++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 350 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

