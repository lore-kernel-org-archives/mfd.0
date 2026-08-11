Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098DF416856
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436863; cv=none; b=Xsewwau4zx5E4kgbUU5aYh8y/Q23/jgUOHURMFXJRTYN5/IDhWmbFkuEfECBAA8lNOGA/kct6l0ZwdKIBNB5rJ47+Qr+rJuNzxZpvipKyptpqIDopNzyHI9MzHPYGlsOi55cIrVRdeEr+YZIb0z9DniQzV6mG24+TQgA9/3IWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436863; c=relaxed/simple;
	bh=T/oJdBucL/GZX1TGkFFHtfiieCAoIbnnu8AL4EXa/3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eOCMvxjZ+ngSvWL0u0pWLrC2yGKLivw3aCkuZpyWXApHKn+TMnM3+NsC1uR94qfJGUYudH9rDx6HZtj5V45rvEbnqidg3t8SU4U4QGpHmWLjwtyVuHwv1NqAut0UM8z4DBy8BpvJy1acvmEQPPJG1uLMT8tnimigRAquDaOu4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ38rmwi; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ38rmwi"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-456395f4e7bso1714151fac.0
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436861; x=1787041661; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SBwLpZVRqRlAIlgjKkHExeL85jOD2p5m6VZ2bA98q0=;
        b=fQ38rmwiJVLUsfze77FaPRSIX8JqzroBaBbqOTnMbVSxBL6wv4Y62b/QEU0VHfa8l2
         c4Gqq1wVMysYC5J3oDrLiyrDd0rKbH38DAetcuOpoF2pXcx/dRa4skmTT3eL3Z4NJSVB
         TMCxc//xz8xwq4UOUlqhEGkwxIIIxjvcyphDpG1ilAxAj1vnxjPxAbc0yAAn+vAn8ew3
         fNCqOWV0IOUbF3nInMde/RqvsNGgn46Ot49pbfiL//9+oNL0IpYzhaXrKZMVqSBCEdfo
         4iA5kMQ3wQ3zuMc6Aomj06+RiGrz2qM29Ldv3xGiT0v0VX9XWOBXdXWynUC48mMxe+pU
         6lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436861; x=1787041661;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+SBwLpZVRqRlAIlgjKkHExeL85jOD2p5m6VZ2bA98q0=;
        b=b4TU2/KP3a9mEbUPMLFy4Axd3ZvwxsVV67EydfyjRE3VjfFAhNLrcphmrk9vYXTeOt
         i6q3C18FW7H80wQQqfhWaoGaNuOhEOtbX+udcEkmh9pAEOqQ31MUe6BrWFmj0XICuOdq
         NooK5UN6X83wpHWDofrYcmRvxgUjvlu5P1JOyy7BQl8A7gH2ccarkz/tSlizw49/nZQY
         XzuYixUvRfVUIgqv9si1ZvccUkDpw9sShpQ+kmm/KTgrfmCtgfKgkC9OeEv8zEYC09YE
         p4hTY3cVYItzTMfvThqcOjQvrrAZNQiGO5G5f68+kgPgRF5nuy28YxKaUyTxxEVXjzSa
         KhQA==
X-Gm-Message-State: AOJu0YwY4P190Tv17l/b9p7O87G2c+FWQ6NuaJdUW8e0lTO0iWh7wz4B
	w9Jh2OoRMuWnAce6cCbVlIBQT1+St6qHcnTcxXZvPQ+8dwHKLvA+2Eji
X-Gm-Gg: AR+sD10cqEjM1qhyyk8Nct8jtOrggDOxlbRlF4fU4DvrNAataj3YsBjvWHzI01PrPTW
	nQF9xB10pTTWYE3r8pKDvSyIyaCY95xIbRLyEv8Dwkr5FO9BF6n6yw5LsCXf4Q6vrQZi6wCXuDb
	FFFT2EvyKU24h5qlQnDWKVjGj9Wba9RTscfE2Ub1NAZmUos2+5Yo5Id4nEMKP+C+l8FJb41zRPK
	pNjjhtGgicTGV/ALre45bhjF7ls54S5sOUam5gwF9J8tfrV1GXKeBZEOGeMnYf+PFjtp52Pippl
	bZfj/z3+QPCecCZm2MbJq4cvtFEzEYwijDphafigKkIlG113A7h9uBdr2gKCTEc1d8GNSXQ4EPo
	xAe9LDOukvoa8piyfFfaijy6MJYAM1uD/TfZYYLhrYhux/wRop7Fcw8Iw8Jkwi7mKxvJp3naP32
	dtFg5IPiyOqcaRb3wac4gxFE4rSGpv2Hyls+rC2eiNN/boIEgDElKEBn1crfyDJ36tHR+JEexOe
	26VCXbh8oEmyPCgC9R1R8dBBgqUVEWDOSM4PbHbOXrqjbdtaILzWPDAH9rM+TEU1OQ3qUopmDNg
	Q9IjHw7kfQbmST9T6ZtNMN1kPaqBQ75tvb8MFIcufbWlQxZRQrFpokdBheoo6Zc0/2meApS1WuB
	fA20GQD5B1uPxChklMA==
X-Received: by 2002:a05:6808:14d4:b0:485:48da:133d with SMTP id 5614622812f47-4b1fd7bfa62mr926088b6e.10.1786436860654;
        Tue, 11 Aug 2026 01:27:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1fff55fdcsm318095b6e.6.2026.08.11.01.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:27:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 0/3] mfd: add X-Powers AC200 support
Date: Tue, 11 Aug 2026 02:27:22 -0600
Message-Id: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNywrCMBQFf0Wy9koSSEld+R/SRZ7tFdNIUkNL6
 b+bVsHlwJw5K8kuocvkelpJcgUzxrFCcz4RM6ixd4C2MuGUN1QyBvmtA06gDKcUgrcgtbKNpa3
 jUpA6eyXncT6S9+7LdfNwZto7uzFgnmJajs8idu+Xp+0/P9d89GCXUQU0UBgUARS0V8xLwaTm8
 tYHhc+LiYF027Z9AEwwUBjMAAAA
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

This submission contains only the AC200 binding, managed syscon helper
and I2C register provider and is intended for the MFD tree. The Ethernet
PHY binding and driver will be submitted separately to net-next. Neither
series has a compile-time dependency or required merge order. Their only
shared design point is the DT representation: the MDIO PHY-package node
references the separately described AC200 I2C node for package-control
register access.

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with a
paged register map shared by its audio, video, RTC and Fast Ethernet PHY
functions. Its shared input clock must remain enabled while the chip is in
use.

The provider enables and rate-locks that clock, matches the vendor
driver's 40 ms delay before the first register access, initializes the
paged regmap, reports the chip revision and applies common reset. It
publishes the regmap through syscon so separately enumerated function
devices can reach their control registers through a firmware reference.

The existing external syscon registration API cannot withdraw an entry
when a removable provider unbinds. Add a managed variant which removes
the entry before the provider's regmap is released and holds the device
node reference for the entry's lifetime. Consumers remain responsible for
teardown ordering, for example through a device link.

The three patches add the AC200 binding, managed external syscon
registration and the AC200 I2C register provider.

The AC200 work builds on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation completed for v6:

  - x86_64 defconfig object builds of syscon and the AC200 provider with W=1;
  - dt_binding_check for the AC200 schema; and
  - strict checkpatch checks with no errors and only the generic new-file
    MAINTAINERS prompts.

The running-kernel and hardware results remain those from v5 because the
code is unchanged. Managed syscon registration, lookup, provider removal
and re-registration were tested on a running kernel. On an H616 board the
AC200 provider reported revision 0x101 in package 1, supplied its regmap to
the PHY consumer and correctly ordered supplier unbind/rebind through the
device link.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- split the MFD work from the independently mergeable networking series
- put the merge routing and shared DT design at the start of the cover letter
- rebase onto the current MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

---
James Hilliard (3):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: syscon: Add managed registration for external regmaps
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  49 ++++++
 drivers/mfd/Kconfig                                |  12 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 170 +++++++++++++++++++++
 drivers/mfd/syscon.c                               |  87 ++++++++---
 include/linux/mfd/syscon.h                         |  12 ++
 6 files changed, 309 insertions(+), 22 deletions(-)
---
base-commit: ffc63a677b60247738b02a2520c6bfa740523c2b
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

