Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040808;
	b=IN7Z11fxFZVGihBa4bXtx7z2tndVTqDhZAEyupxrGMI9Sll+ac0TvWUKdla/WToRPU2Z
	 EH7OVlGegxFH/Q9NCXckJhoPHqVqXABQoIHBtnK0cTpwf+jKEeUVUjCkvZ4z0h8MS47t6
	 O+Jc6FIeEFEzBvc7lPEMFmmPsc2SbDp20BmzMgwhe2RmATuDJbIrFGFwTzM0yYDdCzqWf
	 XKPc6nlQuQ3fWD6gFTTINGI1wwtjO9NH15aw1QxDd2+cXn44Vd5kfif54Uoll1ao6EQid
	 VPUpUIe/q7gY/w73NV/GM8BLGtXyXJdUum8ziOEMsYEooHR0btdpQ5IG6KgonM+MB6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040808;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=h535cRx1lJoowR9ODvMD0xCSoJuvaVaKTrIX0Rn7+lQ=;
	b=x74KhQkQtE9QH3sZKgFx/s5qfJKxNgbhDZnbvGIKeW0HpHtpzzP1FgjPGsriLT6jgwNj
	 vy166EuceCMOOx8y+L8CsWDmjUd2hteTJym3Trjg2T6AzLIezz14YlKAPMQWuwlIyeU6Y
	 Y5flnnAbXwDzCc307ncuuOxCO/DEmauS+Qmu63ZXvJzQvW/jqI5rT3DriUOfrGRZDv48N
	 bupIt32V3n3eUxKxduH5etteJ57b/fBSYpMXK+oRWzybfwlTPNPvi1EdOa6vQPU9UGyqa
	 a5T1qDDFu/UpNmH0pDIjomdO3KCzoz8jtm0IXT7uHUKaOlMKlb5KXYwoDlqyyU1EQxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA9606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AA9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM8ch61trz5BNRf;
	Sat, 07 Nov 2026 16:40:04 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6A78dt1a036972;
	Sat, 7 Nov 2026 16:39:55 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:39:57 +0800 (CST)
X-Zmail-TransId: 2afa6aeee3dd0b4-b7c2d
X-Mailer: Zmail v1.0
Message-ID: <202611071639579755YPwft2Qu3_o0wh5PF2I8@zte.com.cn>
In-Reply-To: <sashiko-outbox-202743@kernel.org>
References: 202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn,20261107162125044ldKkwYPQxZOTWg6IDe_LX@zte.com.cn,sashiko-outbox-202743@kernel.org
Date: Sat, 7 Nov 2026 16:39:57 +0800 (CST)
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
To: <sashiko-bot@kernel.org>
Cc: <mfd@lists.linux.dev>, <lee@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBSRVNFTkQgNS81XSBtZmQ6IGdhdGV3b3Jrcy1nc2M6IENoZWNrIGZpcm13YXJlIENSQyByZWFkcyBmb3IgZXJyb3Jz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A78dt1a036972
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:40:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEE3E4.000/4jM8ch61trz5BNRf

On Sat, Nov 07, 2026 at 08:32:20AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can these regmap_read() checks ever trigger when an I2C read fails?
>
> When i2c_smbus_read_byte_data() fails with a negative error code,
> gsc_read() writes ret & 0xff into *val (rather than leaving reg unchanged
> as described in the commit message) and unconditionally returns 0.

You are right, thank you for the detailed analysis.  gsc_read() masks the
I2C error into *val and returns success, so neither the existing FW_VER
check nor the two GSC_FW_CRC checks can ever trigger; on a failed read the
firmware revision is built from the low byte of the negative errno.

I will send a v2 that propagates the error from gsc_read() instead of only
adding checks in gsc_probe(); the two CRC checks stay.  The v2 supersedes
5/5 of this series; 1/5-4/5 are unchanged.

Thanks,
Shao
