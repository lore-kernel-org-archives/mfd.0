Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7943E094
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222278; cv=none; b=umqFKfaIy9Z02WKgJ2wYV8zjlUMPQvEGPO2w2FACsp22hyV7GsQhjGxqIJfSsWESSIQ5WhTyF/MCxjepmCiS3VdWo+e5nAE7IAMuRnkFTvgWz5VC4uG3rH4ut7tql/yAFUsTUDwtrPMG6wWMKySNl8bNuWDwiyXDIbMa22T0B1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222278; c=relaxed/simple;
	bh=C3uQ3uiN7BajvYBUPArlf4lAnkFjTThYqlRS3waqqdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KuMEbBgMQIzjSQt4Egwt6QO6DG3px6V95NmIkTEhRU7ejS5EFIZa2tOK1h5XrrnXmMHtWn6DDPQJJQPummKdhe4mCr1mLflHWPbq7ss1l0k3x0HuOO9tKLg9RsthjMOwuLxTVukRAhut6iYLEzQUUDgpNRxac2dJkxZ3XRDaKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiaMyvUO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiaMyvUO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cac59f8b64so80968495ad.0
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222270; x=1784827070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=kiaMyvUO1PpDdxEEjoLSg3j2AokKzR6A8exk1+VVlrd+u9PEjU7g91YsLsn6FGMvur
         XgbDn33MLa8sOwApMtZGh5/OnRHvdcHddGM0uJQbcKQnSmAXOixBzkUA2snkgwTGxnax
         yqvUkGe1otfjHfy0EhQ6parrKmlzWlmhM9FPLoEP8omATjyo9qCr9ALmAukBtvwIumwz
         5wJXSEdi3c22XIWWbqpWfDpDI3bs5pLcCLtiRIBxjaR7pQBHYXTs3bChBxSZ0WcsT+ux
         Y6kTOgs36dNKaGtKKtkhGGdccnEM+Ls5XuF7YqJNmmPJtjm8CGBOdo0OKEapx+ZKiYkJ
         m9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222270; x=1784827070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=kquWMMkqP4C37uco1f6YD9eBn35M+D7T92RQToKU7Cpxe2nX9mywPXQNspMzvjPdep
         KRHoGp8LWWrbao0TGkgdX9urvbYJep0w68TRBAaefqkZMJ8uJm6zQmmy04PFYaYSu9ff
         UTkp+u5R1ndCGVBJxZqUAqX8UCfbbnlTrJX3ArpteqEjROvxp9GcIXGmvUjW+/Hn8KjL
         Pwq72xbRrUxzySfZ6Hyi51rsz4z7uRy+xqKOiFo+WyhlacTOT2TNKTN+aYgUGm6FnCtj
         LeIKcVRcU7JI25gjp80rv50hXxRjndiEwYGfOKnDY1VS6KXuzbo6ubsirTQnjGB1EqCU
         tk8A==
X-Forwarded-Encrypted: i=1; AHgh+Rphpn2JWXuNpG9zKZmKKU6zHIPUKSmq6mbQ6FRLuOhMif+QxVCuvHfrZii2IdOgCUhS1OY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOjJWl6JrjC90zp92EMQh/J60XPyN5vrcuSLAOFwrn4QoJG4v/
	0S29t2BehXT+3XGGUNSPhFYnb4J+E2v3vZr7EbUyjsVvWqrolCD1J7I4
X-Gm-Gg: AfdE7cm8+Hb3GU3W+kem11Mfxea4jK6CRbzO6Q3+/Ps4+uzYyeWhIXsKY1LidD6Zy9S
	Xc/so19gA9Rth/jXr6om2E6j8KUNIU257Lv1loymgR7RbVduRiwqalZ7CU2GdUGKX4lXfCJX4kO
	Vw0sWkor22mm8DHE/rkLIDSaoeCRraG3Lt40V4GgXhYqRBXgQ4hrPejsO+MbrKl6NQpvcjf+rOR
	ZUqomSxD4kJQkasDHlVy7CJOGrhrthEl79QIPDOZCycSxk5srDCJUFSlQBOHVo1hNff60djYdN1
	tS4jcLz3i/Z144N4suqh06eA0RtlPaZeShdKkxZLsouw6MiNuIq9gCMXe1GZfr6IdBqtPFzMHaW
	2cic3NnsGh8Hl7yj+MglgOr2pcsy78C+d3D6+gH6M6rfoKK/TjOrAv3PEFeerI+G/y6TRuADH26
	kO20MR39AYC+b4ItaQo70JawV+Oq+wejQTpw==
X-Received: by 2002:a17:903:2ec5:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf03cef19amr85530865ad.21.1784222270259;
        Thu, 16 Jul 2026 10:17:50 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
Date: Fri, 17 Jul 2026 02:17:30 +0900
Message-ID: <20260716171733.300885-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for MediaTek MT6589 PWRAP and MT6320
PMIC which are used together.
It also adds minimum compatibility string for MT6320.

Tested on Lenovo YOGA Tablet 10 Wi-Fi model.

Akari Tsuyukusa (3):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
  dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
  soc: mediatek: pwrap: add MT6589 PWARP and MT6320 PMIC support

 .../bindings/mfd/mediatek,mt6397.yaml         |   1 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   5 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 292 ++++++++++++++----
 3 files changed, 239 insertions(+), 59 deletions(-)

-- 
2.54.0

