Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122332;
	b=JFm+UrXZCnuclcgOr+XByxunjcgFzuPUIMil2Nzyc+KqUQutQgW/UBJUQ+gHBip8mmUc
	 tnGMyNY3ZlxgBXfZf4MvG53mAImBRU5expvScY9AayDzwp6Rwjliai8InPWsNbL9bYPF1
	 s+1xm00rcVYk823x969So3E8Ik6imwDVvGliZhaGTWiRYmvmRQ75Qz37dHnFpFXOVL/aT
	 +F2+Te6GC6LlgTKfV8Uk1K0e45mLkO2ZoIaDkrX9X7EdBsIMoqYsGcNDDTK1SC7HB/KXQ
	 +vKPOQZFzjbfWymnqWXAeFY2VM5jTS7RKSj4KFHq9MfjtgiHCw6gcdBz7DlOB1v1R8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122332;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=o1AfnpvDOdIlxUV6w1EJOtOgU3PvW3osh1278II251U=;
	b=Xcms4et6Eb91LYXIn60wKK/+vnYaRVOkGGa/OF3iBr4bqdoJlgqoohcjw7n5mb6jnJeq
	 vockt5mu03y7X3n6L17fJ3wAfjEmH1m1R0exCOXBo539lggd0etaKVqUOVNBsLXVxjtrp
	 VpV0SO8eX34vro8I8ZJyZy/80irRk/4MZstrm236mw8xx1vcOC13/BE4SZKx3zRZr3wXz
	 f4JpMYdYBKRzKi73jIUV8YTZNeKeNHC9/y8z+HxKqnFYpqWvCGjYoJyrnhJsPke6kJAKn
	 /fHzvlBkiALyPhvDZhKtXSCvKksm9AvzO6PzU13FH8BihAmQsvuyFzbkyAjHIkyJvFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E31606A326
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jMkmT3Tq7z5BNRf;
	Sun, 08 Nov 2026 15:18:49 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A87Iekl022379;
	Sun, 8 Nov 2026 15:18:41 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:18:42 +0800 (CST)
X-Zmail-TransId: 2afa6af02252fd4-686a2
X-Mailer: Zmail v1.0
Message-ID: <20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn>
Date: Sun, 8 Nov 2026 15:18:42 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDAvMl0gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgSTJDIHdyaXRlIGFuZCBzdG9yZSBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A87Iekl022379
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 08 Nov 2026 15:18:49 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF02259.000/4jMkmT3Tq7z5BNRf

The GSC regmap bus wraps register accesses in an I2C retry loop to work
around a chip errata, but gsc_write() throws away the result of the last
transfer.  Every write through regmap therefore looks successful, and
gsc_powerdown()'s existing error checks can never fire.  The powerdown
sysfs attribute has the same problem on a smaller scale: it ignores both
the argument parse error and the value returned by gsc_powerdown().

1/2 returns the last transfer result from gsc_write(), so regmap_write()
and gsc_powerdown()'s checks start to work.  2/2 returns the kstrtol()
and gsc_powerdown() errors from gsc_store() instead of reporting a
successful store; its gsc_powerdown() error path is only reachable with
1/2 applied.

The patches apply independently and can be applied in either order,
although 2/2's gsc_powerdown() error path only becomes reachable once
1/2 is in place.  The read counterpart in gsc_read() is handled by a
separate patch and is not a dependency here.

Shao Mingyin (2):
  mfd: gateworks-gsc: Propagate I2C write errors
  mfd: gateworks-gsc: Propagate errors from gsc_store()

 drivers/mfd/gateworks-gsc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
