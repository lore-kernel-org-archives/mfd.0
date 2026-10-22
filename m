Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657897;
	b=YT6NpDDCb+fKTnCw6iScc7mK4ZBsBA+QkhJL8IK8bGsis7dfgAY1tuGUF9TTF2sk7tOY
	 fplnIbGUJytJ4R7jnye0/L9TTTPU0QoaqWKfVxh5kA209z7GJ4aD1ipaQ8IR39URzKtjZ
	 OlpQLR3qS4/MI7771TRgyiZMQSAnutkRCuR4usaTfFHHfA2wXdhZgJzhE0BtTbmNpyG0P
	 YiH5SurtY9w91ZwwYpGWfhqv/OV+ev0X9dTYn4BDH/XET+tJaARIoIcqGgetpxHvfphwG
	 VhrxS5ha+NjIFfyLWHgS/z8r2Y7kCtCDUXSgkW3DzKVQ1S/eVUAH2FreIrEmQBHDOsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657897;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=STANDc24tjLvIjwpWVUmAsj3lx2tDmc6YgtW+icG3B4=;
	b=GN9NJshBKBMHdERa5KC+JK47Zd8jh84dsjLFsVMzEKULuWW9W68MjtLLBd9yrrkWvZaG
	 i/iZH+N6UbbJnYRWFT0tFrGI6K1eux5HYMkMazlQWfbbqVhgvBG1qx90y5bqCaeAyKGUY
	 q0b3PHg3w6VHbWYK3z+hHVq9DIEUEPHH/07sZiMA8sOp6fGTKdHrWumzYmzS5x+TISpqB
	 YNxlkRDDiDaHzw55hQ0xtXnkSzSwbKKS4/GDdxQ4uyUHQ9VxePlj47wB2NUqs7WLvcX4P
	 o1zspXYxsWUNYnn1GYogiZa0tLH2t/C+xQoWubfuDRJclk73nYQ/9NYbv9LxIwQsZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fUyjrIWN;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A5606A319
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558A5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fUyjrIWN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792657892; bh=STANDc24tjLvIjwpWVUmAsj3lx2tDmc6YgtW+icG3B4=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=fUyjrIWNZngROUclxWWKZVyN/bRgeThQB4k/DjoUpctc/a8tx8gCiSYfCCsdEKoOT
	 eI6Fcpgm5nbNe6p1TI3zdXAuoVAgFwv97ir6Fo0KXMCbikO9gAi1ZiyB5afHEPF11I
	 YMmMjBP4xH0nfUlUFSPm7uP4PbORqu3v0foxg+a8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: MdmyWVu0InhAZ8CuOl+WbGFKb0ebdFMF3mPSDUyiHYO6r7cCGW4mjYzB3NBROn
	 A9jpVSF4u5EGvEY+hd9HqK0oJrog5xvbOMlpipPRJufSIYbzcDiHl7z1PQMAap6nUQRMYmsXXrTj2
	 tk0tu+feORbWkh2MZvFlU6kFWGBDTovA9C78iIph96PStjs9Es57Lo5xtDOysKUKMazNBnBIRzXyV
	 MrDMJ/nR6ENpT11vObm03xfcgHiUZmvbLYBNxYzkM9rWk/c8kXIUlrVRHSrjx1mJjWSwuR5ikLS90
	 IA9oWFvjt5F1LrALDB8oYuhsvLYKtLJ5ZkmJZCMyfCvCIOrYeHecIvDsFyx+oo5L4n3vgJ4ILNe7w
	 IWF/UoBKpSMC6IECVj2Z9f319IRWT7EtoQ3/KSPMVurUnn/z6RI9NhVutrd7FEEPyf2psClNX8xxs
	 s3PodM+x6fnfX+HsW82g3vD8H2txXYRk7zN+9LrD09FtOt6JshsmPGwwAeMukpJ98J91aFKfwVtXG
	 hBG+k2dK0PJajAwkc9bcbgYtz+Q2QR/RrNM6mtAf6w1rBmXaym1TMdQrgHoBFJdV2Yq2POKQKAvme
	 EL86NXj9H2XUOECt/ikrQ4GvvRhc0W9Wo5HM2Kne7g8Tierj5RJN8KGA9QCQrgBYDnaAMIirrE89H
	 /jI/jnpkPoEF6rQGbKH3V/RamkwDMVcm5rYvbUthGDSPKmiwUJk1kKo+Iyv/ZHZrmPUxG48EfbqTn
	 HwXwLKP5guQm5Gr592nEMxLOh8CzkPL9PdfBHto0MAlW9nSWwpa6DmlElREMdAJrqEaSDrqmzII0S
	 sRL9obZFk6mBkHY4RseG3hqBrBd+TNy0yz+nfoR6xF3WORhgAZbTIwwUQwf4/zUhc5WO6AamzLy7e
	 JEZv0CDUEAtadJBWrvTVq+ZCI77/7ajFV0NgGLf9cPk9NrxnZnSqBHWuF/1iL6D3H7rwgSZ5puDA8
	 FC5wND+fVe7bNKWVf/B3mWtxt6n1/TKztIPBU/DRVcT1NTS4JlKx6oT9ngX/okTR18+YLz8bG04q4
	 K40wSnuLyRd1DNII7GNYR7vz6pxerbM2KyZCwhtwsaRd49zRlHj2xiYVP5iDbcjjkWk/Vy7nD++zK
	 zkFHOwuBXxHfZg==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bWZk?=" <mfd@lists.linux.dev>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?bGludXgtaTJj?=" <linux-i2c@vger.kernel.org>, "=?utf-8?B?bGludXgtc2VyaWFs?=" <linux-serial@vger.kernel.org>, "=?utf-8?B?bGludXgtbW1j?=" <linux-mmc@vger.kernel.org>, 
	"=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>, "=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 07/27] clk: rockchip: Add RK3572 clock and reset support
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
Date: Thu, 22 Oct 2026 16:31:30 +0800
X-Priority: 3
Message-ID: <tencent_48E1098E2322016888397E2F4D1D34343208@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <2339330.72vocr9iq0@diego>
 <tencent_791C8CE4050020CEF9E536C9D3B4CA9C250A@qq.com>
	<2117228.PIDvDuAF1L@diego>
In-Reply-To: <2117228.PIDvDuAF1L@diego>
X-QQ-mid: xmsezb41-0t1792657890ti513lphq

SGkgSGVpa28sCgo+IFJvY2tjaGlwIGhhcyBwdWJsaXNoZWQgYSBkZXZlbG9wbWVudCBicmFu
Y2ggYmFzZWQgb24gNi4xMiBvbiBnaXRodWIgWzBdIC4KPiBUaGlzIGluY2x1ZGVzIHRoaXMg
Y2xvY2sgZHJpdmVyIFsxXSBhbmQgbW9zdCBsaWtlbHkgYWxsIHRoZSBvdGhlciBwYXJ0cyBh
cyB3ZWxsLgo+IFlvdSBjYW4gdXNlIHRoaXMgdG8gY3Jvc3MtcmVmZXJlbmNlLgo+Cj4gSWYg
dGhlcmUgYXJlIG11bHRpcGxlIGF1dGhvcnMgY2hhbmdpbmcgdGhlIHJrMzU3Mi1zcGVjaWZp
YyBwYXJ0cyBvZiBhIGZpbGUsCj4gcGxlYXNlIHVzZSB0aGUgZmlyc3QgcGF0Y2ggYXV0aG9y
IGZyb20gdGhhdCBoaXN0b3J5IGZvciB5b3VyIHBhdGNoLCBhcyB3ZQo+IGRvbid0IHdhbnQg
dG8gcmVwbGljYXRlIHRoZSBkZXZlbG9wbWVudCBoaXN0b3J5IGZyb20gdGhhdCB2ZW5kb3Ig
a2VybmVsCj4gdHJlZS4KClRoYW5rIHlvdSBmb3IgdGhlIGxpbmsgYW5kIGNsYXJpZmljYXRp
b24uCgpJJ2xsIGNyb3NzLXJlZmVyZW5jZSB0aGUgUkszNTcyIGNoYW5nZXMgd2l0aDoKICBy
b2NrY2hpcC1saW51eC9rZXJuZWw6ZGV2ZWxvcC02LjEyCgpCZXN0IHJlZ2FyZHMsCkN1bmhh
bwo=

