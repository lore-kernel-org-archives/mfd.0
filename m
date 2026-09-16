Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E824F6488
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569421; cv=none; b=RQWAjgzN1vJ4qg2tYmIRlG5e2Y9tT7D4yjPAy6zjG99oMFrjQrqd9xjwa4gjgQrls7okde+gAIBsas6+feu0DpPhRv8r9F0oZGCMPZQRDPdQeG1EO2mQQTQz55pXZooO2IUcn28WnBxZHWQ5ciiEJTpt2CTzXgParICUEOSW2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569421; c=relaxed/simple;
	bh=b97ne6nhN+rwutKANWXyAqfnCEh//QNELGpWYJAeRek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h6G2WGV+bX91QL3uxtDVOM7aAXN681/9LEKtkG6XRig3GVfaPR+g4Dq3a7WHd1UZWIKvez9JFqgT6jZqVAy9gFTZZiPFsy5m65x8OsH9X7Ixm/hwyLgg6HVmx+r0R8wdHGGM4USuBTKkOlNd7uGgQt2vY8rA1UrUk0fsPaJCr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QERuwUgs; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QERuwUgs"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so1016807e87.2
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569418; x=1790174218; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=udZdmuYZstjfDlOUfIxWazXEs+olz7lSp9cpBoqmYNw=;
        b=QERuwUgsMBCxAO4u2gDBJlXB5pcceOcCVJp3F7oAsprzqJLxpFI1p+OxkmkGAc5/Y5
         ARSd6DfbWE/NTnqbw1/Jwve6ZAFDy0mWj9fBx81qp+YkwaOFA1w0UJqkthv2MPJj6O7c
         XDwW5LTlm356/9X59x/j8N4yBga8HnJ+RtpsOwyoBya1oklxrnX3eQXLDeYhul0An6g6
         JaJC2PMP7HnmvY1yjcVG8/a7fum3fhsRpHk8Pft2CpIINIo9Z/8qaq5FBS/XRdkQjIAp
         kY1TFsCQInMP1HK+SUG4TEhBtj7tNBGS4bxYP3GrV9rdN3JyMT3NA0msuguzo8SdTMf9
         qlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569418; x=1790174218;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=udZdmuYZstjfDlOUfIxWazXEs+olz7lSp9cpBoqmYNw=;
        b=YYTEFc3P06W2xpaSLy7T1d7RWPyBB5U8VKIvGltqcm8lph9QIUyQAN9gw3Yo/TFnUu
         h/rGjHUvFjmxemZDPrsranJGmgXk3pHrTQYGrrWREKxXFEcheO4oI9z8uFsZFQRhx6tl
         H1CwF2yh6H7NAvHsOO9whQXwzfy/hShFJAAsg8UMBV7feF62eabucxA+uDoe9RV+Btwm
         k1f5DRz5jE5PAER3rogmf/woTFP6ED47sJSupfjo/o1G49LqLuLtIjjxl/QFfwNMB/Ak
         oca5j3sBHhcx05P7c32iEyigd2ftCxBbnAZ1Xel9dbpCo+qo5H6JJ2uKoQ+X3Oo/xeMz
         3TTg==
X-Gm-Message-State: AFuF++nwde+ZAguEmYhSmQmk8ksBVGW5TSFT0WISS/wmgCZugwdT+N/E
	M0MIURzggwol6Sl1XAWfqge8JYj+KeQi9bv2LdFitRCt62IrDiVzY78=
X-Gm-Gg: AYBFou1FpZOe0dDLrom/v1kAeebKm+KfEGLAAEfaFoVncvycLyr2mZQEdZwwrdhlstj
	3ZTrdlkYtTMArauV4vJeXrg2Xi3wsQffEEiGl3kPuQBR3h523zzRCgUZIUhkKedOf8s4l86JA53
	dcrSrDXJfEmyeJrH3T/q0S0DUHNQ8U6Z/SKSgl+DcII8EDTKwfnoSS0dJWa7V5kUIfKBomQI8HG
	X1g8UrkZCmNJuKR3hdqY/wgbr9mSnTC1/YWAUiUDPQM3CgoyDEjlXt6U9k6sRkNltQMLjM4y0CL
	AArleBiSDOGzy94qImuIUm41QA9Nd3Qzrmy/th/+aBWi/blzopZYjuWupeVQ5w51o2EcJIEyYpT
	lyDXOHrRL7li3hVS6HhXvkKVQR4WvPGV0ox9J2yqy4SSULhcO3nEi8UtfOMhicUvXeKAoTWs8Pb
	c8nJ3qhwRlc3O5vYvn2cPkqnfZpZDCmkYr8ZhHkb0OY9aJrhEaYWC3ZyhMB5ZK325bO6rrXbQHN
	wZGa4GHvQdtuYkQsQ+ZNi/u
X-Received: by 2002:a05:6512:15a3:b0:5b6:1a7c:fd82 with SMTP id 2adb3069b0e04-5b8b6652840mr832742e87.40.1789569417297;
        Wed, 16 Sep 2026 07:36:57 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:36:57 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Subject: [PATCH v6 0/4] mfd: intel-lpss: Clean up and modernize DebugFS
 usage
Date: Wed, 16 Sep 2026 19:36:38 +0500
Message-Id: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHapqmoC/4XOTW7CMBAF4Ksgr2vk8R9xV70H6sJ2ZoKlkKAYo
 lYod+/AKgJUlu9J8725iopTwSo+N1cx4VxqGQcO/mMj8iEOHcrSchZaaa8CGFmGM/ayP9UqW0y
 XjqpEIuMa1YIOTvDhaUIqP3d0/835UOp5nH7vGzPc2n+5GSTIxpickieiHL66Yyz9No9HceNm/
 Z7QTESIliK5nL15JMx7wjABqUGdgFQI+pGwa8K+JCwTClOjMe4y4NMXbk34l4RjgseDI2es8rs
 1sSzLH25I+SjAAQAA
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=b97ne6nhN+rwutKANWXyAqfnCEh//QNELGpWYJAeRek=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmHBCfjZAaIA4SzJMoWSnG83WfdJZnciwpqu
 K0t3Eh2rxCJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 okBhD/49kjJF9RwBA9tZs5HafTCdhYaTPsadml8l3G1KqZ+H8eWrLdlTmu4vv/nZ3bshhGCdJuj
 ADX3iraFBVOKj/WLyq+ueUeQe7s77gi0q/zs8kAshR2Pf4Gt5AZD+cqZZTV/se+fRumNBo0y72g
 0nDQnu8zZ7O+U8QuMWgs8bA656Quzij8mAE0wTJDPOTZNOzzxyM7/XOgebunL5mGVzGfeczNX2s
 HBzVfjtBc0c8yoqq8nxnteOKiLurGx9BadLpYp0s5NPZ9LBAoCuydq2evJuJ+Ku8MQYxwcoVB44
 qVPVn5t/pt4dZZnXFDP7oIrBae3YuwefBKG6vUO5w4w0apnHmwT3VLh5pkFAsaSFxYVB0oFHG96
 BUOy3KZGACXfAFTeXbLoSM1dQ5zaF53bUciWUxL+yoQfpSTPYIHK99d/1G+NEkGPXk5CTG6svDP
 BiTkfDz5DPUWZUNU8ZoVQPLRfu8H3WVjEijPqVCf8P9SnOargRKwm3KtPcIH1TBWrg9SMts4QC7
 6jlYZ0JbaTiJs4wOR9yEGCeQeNcf9868TaDG0nTvqNxydiWWn9WWPxk7KlCMfYXqLS1dE9lADGR
 5z4A2gm6gn7SYyD/NcxnwFIkHx83oiDO0ND9+wH7lI3undFR/AC0bLB+PKiJTTpGD8rfsXdFn4d
 3bMKV6XEElbF9DA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

This series cleans up DebugFS code, modernizes it by replacing
obsoleted macros and removes redundant error checking.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
Changes in v6:
- Split each logical change into an individual patch.
- Link to v5: https://lore.kernel.org/r/20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com

Changes in v5:
- Changed the goal of the patch to DebugFS modernization.
- Refactored intel_lpss_debugfs_add() into a void function.
- Removed deprecated macros and functions.
- Removed dmesg message completely.
- Link to v4: https://lore.kernel.org/r/20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com

Changes in v4:
- Keep the dmesg messages, instead check whether DebugFS is initialized
- Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com

Changes in v3:
- Fixed commit name and description.
- Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com

Changes in v2:
- Fixed function name in comment section.
- Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com

---
Maria Lisina (4):
      mfd: intel-lpss: Remove redundant DebugFS error check
      mfd: intel-lpss: Use plain octal values for file permissions
      mfd: intel-lpss: Remove extra DebugFS dentry
      mfd: intel-lpss: Switch to debugfs_remove()

 drivers/mfd/intel-lpss.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)
---
base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
change-id: 20260913-intel-lpss-debugfs-eff3580d1295

Best regards,
-- 
Maria Lisina <sekoohaka.sarisan@gmail.com>

