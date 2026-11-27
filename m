Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751615;
	b=GeyHKYgI869BxD9CLEUmOIE1m3gbSZ0H8pXvW+GPfW4nxcUE0QRXXl1uZ76M9ahdAeqc
	 JTTDzXLTmAFspiMnRIua8L2u0N9t9W2ER3T7/T+Igbn7kJ1gD5hozIikGXVnbKQwWwyky
	 0LLbauEMD1V5qH0++Hk+SGOorNshjq1x9BzDwjXPvCmdfro7zfhDV4keqSo2AGdlxoCDR
	 LKosTWn5MEL5MGOrIyvqZq95CJHvqlI49+Ny64o5UrGjQM9taY6kSNs66fpPCT+ZOO3/+
	 532TO+k8vrsl0LHJ4ZIMLIT6XYxdGbTKswJxV7wlZ8Xf1eG+Pl4p+Yih+dLYzwRWWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=DpfRq3v/vFUuP/GqS3HMHJixsm72InVae3hSHlg1iNY=;
	b=bqOWcFbpqh5gmhAZvCqo/URUZd0K4YyryvrxU1iwqIQJ6dYolH4FYQykvhY+n29pKIh/
	 37+VaeXG9BeD98LRFHTqv9LD2UiA8hn+SbpqfIdrAwQmxyX2S6SdEr1sQyKz31BAuXr+q
	 wFqNilFl1o1Ij0+vgdxRLY/svhcASuaYtapZ+vpIlVzo52E/+FFiuOq0qWYyAb5grCaqG
	 kiT7CpkUon5qjivZnbatN9n1cBdLsOGSX7NBGvWkMnb3gbTTB3tTkqqVQ9L22KBlTywJH
	 R364Dg/c+0MClMQecienq2XjvQz4N9yM0vgYiXaVTHYRSuSxVSIyZ1L2Nrhxkctk5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=LwyIBLJo;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E4C606A31E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 03:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=LwyIBLJo
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jbKJk10J5z5B0rY;
	Fri, 27 Nov 2026 11:53:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795751606;
	bh=DpfRq3v/vFUuP/GqS3HMHJixsm72InVae3hSHlg1iNY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=LwyIBLJoyZNd4MWcbqJK6ylGe6d1m/Ijw8cWLBNxOcVBk4k8iBfjzqC7VOC4zQGO/
	 P/0kqnjH/WpzuIT3bzhLAIkGGtHggecxcLOtFTDnNVonMlaWkuyaYbtPIXRTYvJx/X
	 3aEI1ryOxNOvjGtKc1RS/zRyfBLjh695UmwQsD8DoD2wtLKbl8wvRtpkWKPN3rB/4N
	 MjjB95p3LKTdglaVE2p+JpAN1r2UI0VLNd5ekBb2GPkUI4dcABH9dervfVHVVfgig0
	 LyvWuwzdnq5IdbiUABcCDixM2DlWLKF9p1oV/ADeG/6MGLBGzrco/NmI10A9OE/W+z
	 1GaTOaN5X+4lw==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6AR3rJB2020213;
	Fri, 27 Nov 2026 11:53:19 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 27 Nov 2026 11:53:20 +0800 (CST)
X-Zmail-TransId: 2afb6b08feb0080-e49bf
X-Mailer: Zmail v1.0
Message-ID: <20261127115320872WMZVf3eQq60Nr6irvJ5ax@zte.com.cn>
In-Reply-To: <179442103029.44545.1262285836401934201@kernel.org>
References: 202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn,179442103029.44545.1262285836401934201@kernel.org
Date: Fri, 27 Nov 2026 11:53:20 +0800 (CST)
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
To: <lee@kernel.org>
Cc: <mfd@lists.linux.dev>, <tharvey@gateworks.com>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgSTJDIHJlYWQgZXJyb3Jz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AR3rJB2020213
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 27 Nov 2026 11:53:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B08FEB6.000/4jbKJk10J5z5B0rY

Hi Lee,

> Should we propagate the return value of regmap_read()?

Yes. v4 stores the regmap_read() result in ret and returns that error
on failure for the firmware version and both CRC reads. If the SMBus
read ultimately fails, gsc_read() returns its errno. Probe stops before
registering the child devices if the version or either CRC read fails.

> Also, really not a fan of functions in if()s.

Understood; the revision keeps the calls outside the conditionals.

Thanks,
Shao
