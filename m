Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699688;
	b=h4RkxtcVttVBixE9PA1ViAakb3NRbSyW1ssGSpqIF24l3qxNuGeb4OuARgYkEZct85+b
	 V/wiHgT6R6svxvzHulZUDx78xrg3IEEcn5MdxlAPFPQfhL9m3WLVnF05IXVeZj9Mg9UQ5
	 mnGtEndgORzpPy9WlU0phHnI9gDUdVgY/nOCoN2MhCRJS0y7s6UNC8+iWEi0404S2z92P
	 rAssxe0hezsaeMhH82GJhhHcyYgDEUur/4JINcIhrBIJtmVwLNfhC/oqwNIOS6n/GfvYi
	 k3IT1+EljKq8QGFXGZp0DqIL/7TxxY3EmGOITE/bHhExLQuD7ZrU64cS9dPkTWS/xhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699688;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=A7U0p07mSQjHdlfkkKjfj2Q1Dpcjaay0LcPO70PEIsw=;
	b=Xrfd+Eux18ZFWBMvEDhyDfzRKml1wmjCQas9EB5z5xJFrMFlz3mwXZv0BEJIPUJlTx7U
	 j4i/TVtJhvJRimh7m9I/feHvBwJlU/BpMV0tVkeZ7O7f1h2qvHE2R6R3OUu1eeZMtErc5
	 rtItJU6RkKJtiuMhrKr448EoocdpM8R8l2nIzE11n6DBKUBhYytTDupeBVNfTL4HVFllv
	 zPpzQ2TfBAfXunmBZKaigbfj+zbxHr3kM9OEu+is6+w85INX2GWUJnfOOigCjZnhqDqgu
	 wfx04pNFc/zdRSVW80DFrbFbHkk5w09lR6/zNrLCko6paDSQpF2jEUNpNN/9tPjSmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=XCxYiaRA;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B76606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 13:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=XCxYiaRA
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb3;
	Thu, 26 Nov 2026 21:28:04 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: lee@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	j-keerthy@ti.com
Cc: mfd@lists.linux.dev,
	linux-omap@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/2] mfd: Remove LP873x and TPS65218 child devices on teardown
Date: Thu, 26 Nov 2026 21:28:01 +0800
Message-Id: <20261126132803.4091137-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180ab32b03a2kunmf8b0a91135d952
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhhPVk9MQklMGB8eSBlJSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=XCxYiaRAbROw7JBAXl1x5Q1+M9w36CGQtdJcoMxgV+jy7uvCAxuCUdThCiVBEJDCzUxPetDtzK0/3b5I196j9IXxuMdnD8u8bgM2nOsZwcxDE9GQoRFmLiv+9nmHmuGtJFYPrxcL719ctDLRiioIE81BYJ35zdFb4e30zJ7Glko=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=A7U0p07mSQjHdlfkkKjfj2Q1Dpcjaay0LcPO70PEIsw=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Pair child device registration with removal in the LP873x and TPS65218
drivers.

Tian Xuechen (2):
  mfd: lp873x: Remove the child devices on unbind
  mfd: tps65218: Fix potential use-after-free by child devices

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
