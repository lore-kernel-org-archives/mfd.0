Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649009;
	b=G5cqSFyjciDe7WX08LHHfvHq4nrJf3PCALp9YjGZNYwqE+bxD7ZBxXEEdIT2ImV+AX34
	 lRyRi5M5fYT5v0Ny7B+EJj6C8eF1Hg45eZdk2xqx7WtD19fOGGvHdlTMThikreOLWdmZW
	 urQCv4kVmZLliF7V1D1RNhzD85IY7381TizPV5XiDOrDZU10PqJXl6197Jh67D4IBKiJ+
	 tc8GIaQaw+yC/xyYgfUOSFRyktCuqXPkhwblMUezdEx+BmUzAXS5IsQrzghKhHRFyVDiw
	 Tf7sik9yBpZkNXlH16bDL/wGg/HE3CtI7e3DL+LSniE5ancjNYP+H6Wzkd03hYulhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649009;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=P7zxgzzTYI172zwYyaCUL/lcmGtqRhZjbLJauuKN8eM=;
	b=IxARODUD3OJW9g5Ra/ez9AcanWtK+H7RVvR1cVp1clg017H9GoGreJUxZ9Ogzt2luc3X
	 g5X4wo1JA1BUKJm7X1XkgB64xj7UlmyDKOuHqcQZ2gDxYSMIR06DC8ayhupANoz8xBFtd
	 D0Mje6XoXqIUYoLeNGzooYOQ+ck+ji91PYlABGRg637bHvFxXefYwSKL2tRQIjBMboR7C
	 C/WG3uCH/jwTRpnx9zdx+POh45Qmw/qQzkeu/vGQa+irU8c5HyF1KIOBDHmFBsVQAbxPE
	 yVcKaLo1su2hEOUrTHMxrunUqC4U8noMCgTP9PUv9PqKWpEwAeBtGWDoUlNS2zYu+hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=iCea2MQt;
	arc=none smtp.remote-ip=43.163.128.49
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6E606A31B
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 06:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C6E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=iCea2MQt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792649004; bh=P7zxgzzTYI172zwYyaCUL/lcmGtqRhZjbLJauuKN8eM=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=iCea2MQtZFsBRko5lmT234iGtA8hnpAaMIAIMC9xxhHSYsKLv/dyorPMsRnk8tOz3
	 +YqFVQeHFESL7IhfzGpYEBaBcXZq35Lcq8o1hdjvoQ3muhfPIDB3TfzPTO1oH7okDk
	 zCKuGfDMCmy2cPvRSdZRC3m9/BhG2PXeckJ1PBB8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: NNWesLkrH+Yr/HKZIoi0WG9ez0k2A56Ft9TfkyVosLzXtqN3ayo1wQKS32Od7J
	 rsntzRg61vrbIc0ur6zvUNfs5Z0Re/GHeEv4ABijBGztu7S4IhbA2O+W1V7isKOEZVyEFsz5k3dDi
	 Fw96qK5EVfIwuEDJFdThOYDlYsVIXiS/39W2CSw+JjCJAlOop4GuZtBTTjddg3ezS9o/f5jA8aHs+
	 XQdSfw0ncmKJuOpqTPa7o5RWNdr/SDH3/P/I3NNkriRZdoda4WF/wVqhkP8aVExTwMK6cAc6yb93+
	 uTFozLSsJUDtFFKy6kcpcdfD/ibIoASJAdvZOoGAA9dcCJcBjI5SX7tf+7jbYjS0rOJ8P1Sl6rHaj
	 tnNhsguhs8jmuI+950uv9/ZPhoAiUQWdmIZIID6UF+NxV7+BwQwOUFfyCitiGG3LiLyw0Zo+2mbTN
	 6qWZpMFBBE2DBqHF2hu8v0voOhTRovfiFW7P6pttu60Yum6oKPbGqROsXD+tcNl1iAVb5tLvZxcGm
	 IRGGWv3+znRwYSFxMJT65PqDcaB8fGJVFl82H/BQnybDL2SvB38hjs6FB9zh/EjZH7xjnCFvvvBsg
	 qzdHXanXjUGfqhte38SjEugNz/onLzs0c2/QUSELOnonEtlQusHT1ODInD1sGno5jj8yFMfnswkpt
	 GPJ7GVycb7ZJ7nyjFqpBYDrBXDwEYC3qXastmifzSA2fYA6WEKMCk/YLkvI9nVknBf03OHpLGo+Qy
	 by6MY9w2tvMlbvBJwj2+DAqyiJBQQ+PIkt7pM9vVeeP+vltmP8R+wCl2WgEqGq7i85hQhj8TL6Gyy
	 4WTFw/ScLocaTGF1qQUcgr5m4UyLE+aV8IxB/rqKVeI69+yWx6UdxbE2giq6P1bBxZ6VI84YPGc6s
	 5K0O3yZbd4Bhj7lzdB8/OaqtO3323krcv0Ot5FPMRAXQSuxTvVlWbQBftvYNiwND9nw6vVSugWvlP
	 v4ekI+BK/6J1KNAhJrwn8jeBPTt/Ky1cwMsQlXt57y15zysSbK4UjFP3/6/ycTYqBVYa35JsdueXt
	 +ha4B7IrhED883s22djs80FgGg4BPFwN6TOaw
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?QW5kcmV3IEx1bm4=?=" <andrew@lunn.ch>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bWZk?=" <mfd@lists.linux.dev>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?bGludXgtaTJj?=" <linux-i2c@vger.kernel.org>, "=?utf-8?B?bGludXgtc2VyaWFs?=" <linux-serial@vger.kernel.org>, "=?utf-8?B?bGludXgtbW1j?=" <linux-mmc@vger.kernel.org>, "=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>, 
	"=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 14/27] dt-bindings: net: rockchip-dwmac: Add RK3572
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 22 Oct 2026 14:03:22 +0800
X-Priority: 3
Message-ID: <tencent_5D642036FAE534DDD2B8C81424688CEC060A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-14-0b0fd85a31ee@qq.com>
	<09c223e6-6872-4bb6-a915-870c3ee614cb@lunn.ch>
In-Reply-To: <09c223e6-6872-4bb6-a915-870c3ee614cb@lunn.ch>
X-QQ-mid: xmsezb41-0t1792649002tmzzbeu1c

SGkgQW5kcmV3LAoKPiBTaW5jZSB0aGlzIGlzIGEgbmV3IGRldmljZSwgcGxlYXNlIGRvbid0
IGFsbG93IHR4X2RlbGF5IGFuZCByeF9kZWxheSwKPiB3aGljaCBzaG91bGQgYmUgY29uc2lk
ZXJlZCBkZXByZWNhdGVkLCByZXBsYWNlZCBieQo+IHJ4LWludGVybmFsLWRlbGF5LXBzIGFu
ZCB0eC1pbnRlcm5hbC1kZWxheS1wcy4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJIHJh
biBhIG1hdHJpeCB0ZXN0IGFuZCBmb3VuZCB0aGF0IHJnbWlpLWlkIGhhZApsb3dlciBwYWNr
ZXQgbG9zcy4gRm9yIHYyLCBJJ2xsIHVzZSByZ21paS1pZCB3aXRob3V0IHRoZSBkZWxheSBw
cm9wZXJ0aWVzLgoKQmVzdCByZWdhcmRzLApDdW5oYW8KCg==

