Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA53EAC61
	for <mfd@lists.linux.dev>; Sat, 17 Oct 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221587; cv=none; b=tpW/4z5b3c3kKM6cfitlmCgsC5xAx0OzjexI4jCTSVaRzcJHFXXO9S3P80MxlzmNASZGBkAVxZunLu+or1hrOs+TD+SqziDMAhXoUTPI5lNr40Na8/NjelFz7Afx2ed03C6n4RC0DKQuhHQWED9chvQd3LLaTv5B5UJaZVwMKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221587; c=relaxed/simple;
	bh=kleCafQ2tbdCWcx2tAP4KYqtAoREGgnit4EOF545+WQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=XKBOjGUHTDfljpU/tlcjFgJYkn8c9anFqC3lSIKHFyXYrQ3fMLSulZtvMD9kWZ/d1CF3cwkKz88EX3UORA9Nvrb6pvZnkR8SJ4HwULkVc0iX93F3BRuPMp613bPDkCby8PlTkgeorA6PfTYh7rpxaxbCl5QInugHmpnkFolb03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BpAj4HMZ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BpAj4HMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=kleCafQ2tbdCWcx2tAP4KYqtAoREGgnit4EOF545+WQ=; b=B
	pAj4HMZWnviarGEFUrUVPZ28cCD1utgvR4av/XjMmjAVEIYnWsp2UJ+rVUqu5uqX
	7+7p3qjvKHj9yGORCugvhfrL/8OO/F/Lqv0S47qXJKxGgxIvGqcWEJOUD/+n6GG/
	2U60U6jcOzJupYTcuzGUmJWCLYdPAcbJMnyaJbjgSw=
Date: Sat, 17 Oct 2026 15:19:35 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH 1/2] mfd: si476x: queue polling work on freezable
 workqueue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016100503.2581955-2-yaojiale02@163.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
 <20261016100503.2581955-2-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6Zvk0s4yWdZekdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH//aXo2i6zGtYStkiKGNyAA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <3408032c.1796.1a148baf98b.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgDnX2WHIdNqbPpaAA--.123W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQf4M2rTIYfpYwAA3U
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAxODowNTowMiwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5TSTQ3NnggZGV2aWNlcyB3aXRob3V0IGFuIGludGVycnVwdCBjb250aW51b3VzbHkg
cG9sbCB0aGVpciBzdGF0dXMgb3Zlcgo+STJDLiBUaGUgcG9sbGluZyBjYWxsYmFjayBydW5zIG9u
IHRoZSBub24tZnJlZXphYmxlIHN5c3RlbSB3b3JrcXVldWUgYW5kCj5jYW4gaXNzdWUgYSB0cmFu
c2ZlciBhZnRlciB0aGUgYWRhcHRlciBoYXMgYmVlbiBzdXNwZW5kZWQuCj4KPlF1ZXVlIHN0YXR1
cyBwb2xsaW5nIG9uIHN5c3RlbV9mcmVlemFibGVfd3Egc28gaXQgc3RvcHMgYmVmb3JlIGRldmlj
ZQo+c3VzcGVuZCBhbmQgY29udGludWVzIGFmdGVyIHJlc3VtZS4KPgoKRml4ZXM6IDczMGEzMGFi
N2ZiYSAoIm1mZDogc2k0NzZ4OiBBZGQgdGhlIGJ1bGsgb2YgdGhlIGNvcmUgZHJpdmVyIikKCj5T
aWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPi0tLQo+IGRyaXZl
cnMvbWZkL3NpNDc2eC1pMmMuYyB8IDUgKysrLS0KPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvc2k0NzZ4
LWkyYy5jIGIvZHJpdmVycy9tZmQvc2k0NzZ4LWkyYy5jCj5pbmRleCA5YmNlNzIwYTBhMDguLjhk
OTUyMTEzZjhhNiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbWZkL3NpNDc2eC1pMmMuYwo+KysrIGIv
ZHJpdmVycy9tZmQvc2k0NzZ4LWkyYy5jCj5AQCAtMTcsNiArMTcsNyBAQAo+ICNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KPiAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gI2lu
Y2x1ZGUgPGxpbnV4L2Vyci5oPgo+KyNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4KPiAKPiAj
aW5jbHVkZSA8bGludXgvbWZkL3NpNDc2eC1jb3JlLmg+Cj4gCj5AQCAtOTcsOCArOTgsOCBAQCBz
dGF0aWMgaW50IHNpNDc2eF9jb3JlX2NvbmZpZ19waW5tdXgoc3RydWN0IHNpNDc2eF9jb3JlICpj
b3JlKQo+IAo+IHN0YXRpYyBpbmxpbmUgdm9pZCBzaTQ3NnhfY29yZV9zY2hlZHVsZV9wb2xsaW5n
X3dvcmsoc3RydWN0IHNpNDc2eF9jb3JlICpjb3JlKQo+IHsKPi0Jc2NoZWR1bGVfZGVsYXllZF93
b3JrKCZjb3JlLT5zdGF0dXNfbW9uaXRvciwKPi0JCQkgICAgICB1c2Vjc190b19qaWZmaWVzKFNJ
NDc2WF9TVEFUVVNfUE9MTF9VUykpOwo+KwlxdWV1ZV9kZWxheWVkX3dvcmsoc3lzdGVtX2ZyZWV6
YWJsZV93cSwgJmNvcmUtPnN0YXR1c19tb25pdG9yLAo+KwkJCSAgIHVzZWNzX3RvX2ppZmZpZXMo
U0k0NzZYX1NUQVRVU19QT0xMX1VTKSk7Cj4gfQo+IAo+IC8qKgo+LS0gCj4yLjM0LjEK
