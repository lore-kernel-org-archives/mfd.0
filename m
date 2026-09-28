Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C76143FD06
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593193; cv=none; b=kD5asFE21bceOvX8rYrJ4mO+hZtc9iMZIdqAdA6AvczZuQ2XPA/xHm+Jmo5dWBaabcTc91tpRdQUTrXNnCJKJSfA7g77vmyhEYsNxY4XIKaZR5mYxXsqRkfso4VwdI7ZAQTgbxWYh21nL12SHF4u5M4Ft1zXaNC6E2ddS5QWTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593193; c=relaxed/simple;
	bh=Z/TbL+f5y66cEvFdcPui4A1BZw7D17pmKF753Ddweow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=envsGM41X3f30TQLppbD4p4q5fpwgMZOxJAtNCtWeEBEVmNOceL8nTkvPD95kWPG2KmVnlZiI709mbUHT9pDT5VArO52jeOnvlNfz7sw/mrhncfz741jNsBVR27LNdHD2JccyI5YstZs4ClMK3OkDDWt1otHE417nA7pPitSa2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzoEtZRT; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzoEtZRT"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d5764feso239324a91.2
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593192; x=1791197992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=13W43cLXRXsI0d5QLq3dIA3hqC2euMzWoSZniybdW38=;
        b=QzoEtZRTKFIihxNV8LPh6BqgEzuPKbl+091NAYYH3b+h3prfHl7Ns7is7ZFoICq0Gg
         07GrSX4a6BvrXQbREy2LYbEHX4Gqo8auNIIIhvZBhZdZuBcdK9Tp6fKOxLCjc+GwlQBM
         S4uHamHgem/5CinWqvNHZUxZN59B5oDbdpDWIZrBIRmxXjzNY1F3r+kunk1GFWkDycNt
         49pAZ5fOBp79nqUHw2Bl97+0xvR1goctyo+iRbP9AYgJEo/U9cvcD9+5KrgAwR4PreUC
         q4wdU5yiowtwh8/yTLKq/txmBFpW1alkbAfUWzODumxhq5PRLhjwCK8qFmZi4GIVtz1H
         /sOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593192; x=1791197992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13W43cLXRXsI0d5QLq3dIA3hqC2euMzWoSZniybdW38=;
        b=QsaeT48qNRyCcwRuMN3EUedTvf4HoOxLkPfRhE0I5+sdbQ69pWK2eaq75W0N1OrToD
         bRmuc8TPPp2P3cy1bHnhXOAimmILQhP/YyVBo4wLtU6c1hy+t1lhxvXpsDuEu+LkeAgW
         0DrnTYmbWpUrOcVeaajboGO3nWw1+/U9ONLijfIzuXBbvuU/CS/tn9EmlPp/L/3UlcfZ
         KpA9eb7SkjEWUQzeyl9CxyfGTs3UGk4xjhu2EmtiyEimmqa17VdKI+FkohwQgZweS6ua
         kN4TcXfXBL6p2bYT8cAKaVcVLV4+6iK4Z/17+C3lw/Ltet/C/HfxZYq+Ns9SdC+n2Lz2
         hzqw==
X-Forwarded-Encrypted: i=1; AKwUvBzcjhGL8y2ULqWJUSsPom31lxd9Luwde2OjTmbqlAqL41jXjIEVvhTc6k5W/xzzjnATOP8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLfPFAEzbe0cVUm8oa1dAk7DE9SZtrRO0HfLhvz0RdoInEaGond
	NgYuCWOO3chYio9RHb6yGGl/8j5CH6QhQpzlSq7daM7aBE6wh+5KzibE
X-Gm-Gg: AYBFou2lJGUhCUSyu1fZOQzWxWDGVS1CF4YlGsEVAaUoIOZTF8kgK+bF/4zg5rd2ze7
	enZfs653S8NGGdwpiCSrriVq927N4QFoLwLy64c3+9mHcOpmHC/ODk2Y5A766BjaGk8oeuidljL
	8gLLs0PmnF4Mojf5XSgBhSbS6uS6NM3QZ0UgmTa6vPvcqC0t3TCbHqqOVpekHL3Jy1AjkMXhY2a
	Ggt31GSNLvcg+QlfHpuB04cHTrEhQ4n+b5TfnHihDi0/ytXLnmBVTpMlWd6X8MseLa7UTE5NTRj
	5WLIEih+Lci3KT/upS0yLLvEAz/5NfMrHsxT6CejvPivLkyRkZ0YvqlJSCQb4PW3mR/kBO/yV77
	TNzfZr2SlOJpgDAgyGDIrBGaaV0KtNyhoP5Jgits2lTo6NC+yfFw8swDXr2Cas3Uyvud0zzrSZA
	ms6khwpCrHXWInlC7JvitAnfaTWbTLK0Twx0TaWYtqoyuoxzOVy/DYU0IbSDNaWSU3BAz3W1xCx
	LI2klQV7I7MIemJSGc3lX9Kv5OknCUL9dynDi0rdXaA1RzmrQoWOYgs2QCcKZlEXxKSNjXUYGTI
	FLbz+jBTKOtX/DOjH932mztVnko9MV3lUSULtFKHEY3dWelfpap7VpwMAGrjalyyEWcVng==
X-Received: by 2002:a17:90b:2250:b0:39d:f247:bb3 with SMTP id 98e67ed59e1d1-3a098b4b334mr10336489a91.21.1790593191490;
        Mon, 28 Sep 2026 03:59:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm15924651a91.16.2026.09.28.03.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:59:51 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev
Subject: [PATCH] MAINTAINERS: name the lee/mfd for-mfd-next branch
Date: Mon, 28 Sep 2026 18:59:48 +0800
Message-ID: <20260928105948.2186851-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entries for MULTIFUNCTION DEVICES (MFD) and SYSTEM CONFIGURATION
(SYSCON) name lee/mfd without a branch.  The repository's HEAD points to
branch master, which mainline already contains.  linux-next merges the
for-mfd-next branch of this repository (Next/Trees).  Name that branch
in both entries.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..947bf56a51fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18649,7 +18649,7 @@ MULTIFUNCTION DEVICES (MFD)
 M:	Lee Jones <lee@kernel.org>
 L:	mfd@lists.linux.dev
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
 F:	Documentation/devicetree/bindings/mfd/
 F:	drivers/mfd/
 F:	include/dt-bindings/mfd/
@@ -26588,7 +26588,7 @@ SYSTEM CONFIGURATION (SYSCON)
 M:	Lee Jones <lee@kernel.org>
 M:	Arnd Bergmann <arnd@arndb.de>
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
 F:	drivers/mfd/syscon.c
 
 SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message Protocol drivers

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.55.0

