Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436B378D7B
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145126; cv=none; b=YxKtPlt3bj685gSKX3S7pxCYModrNc245SM/a4bGPDqc7grpVMhwDCK35HcuAHdG1gcEE+vsfqJ6Ge04IRtyPakHZWxpQ9j/Kw0ZeblEuExmWQOfBTVoPvKns+1wSuUBLV087eBf5CMB/Gg04IC8coFLs7ML/23AM8wivjaBsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145126; c=relaxed/simple;
	bh=Rc6z+y2biqvJlpwVYU33O5GItfmEDVvpyrJkhwmOtQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RRacMyHwY4vuTHalbX8ak1MQ7GzS4lxwn3mwR4CQfQHC4PLBa/uVRaBOTY3pk58Ex0STFDHkDNcB5fs20HBIvNfwFCvRsseUGx9B8b5x5IoJbHs/6YPk0VwW2T8LAzgek1a3vA3xDpzPE0+kVvV0qBk+JcMD0BV+8VMVVJL9snk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=M34ELMVk; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="M34ELMVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xd
	VVHRjMkMsccOnlpmoSgAS/z2mmrUNBS2jnqqkHyH8=; b=M34ELMVkNN0mCLDOKa
	Hz8Fj5RC5NTnSWyZs7fxo++h8pmPbBZIoO4xQWXDmc89fjxjFpgfGYzISbyNRnof
	6+qNd29EIKyqWu+lsIUvNCAtaG7SW1+Kl2u758+hoCFUmu0cVcnJa/KnKL/PPFMJ
	r8TBftrl0ne8OhHRzvGbzk1yY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3bwfR9tFqDmHsAA--.18234S2;
	Fri, 16 Oct 2026 18:05:06 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] mfd: freeze delayed I/O work during suspend
Date: Fri, 16 Oct 2026 18:05:01 +0800
Message-Id: <20261016100503.2581955-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3bwfR9tFqDmHsAA--.18234S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4kWFykZw48GF4xGFWkCrg_yoW3JrX_ur
	Z7GrykKw4qgr12va4fCF1vvry8C3y8u348Xa1vkrW2yrySv395XFnrGry5Z3y8Ca1Yyrnx
	X3s0g3y7Awn29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjfbbtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRMBO2rR9tN61gAA3W

The SI476x polling callback and TPS65010 event worker issue I2C transfers
from delayed work. Their current workqueues remain active while devices are
being suspended, allowing pending callbacks to reach an already suspended
I2C adapter.

Move both callbacks to freezable workqueues. Preserve the TPS65010 worker's
power-efficient property by using system_freezable_power_efficient_wq.
Each patch is independent and can be applied separately.

Jiale Yao (2):
  mfd: si476x: queue polling work on freezable workqueue
  mfd: tps65010: queue I/O work on freezable workqueue

 drivers/mfd/si476x-i2c.c |  5 +++--
 drivers/mfd/tps65010.c   | 10 +++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.34.1

