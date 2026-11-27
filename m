Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765466;
	b=CXL00/2fT3dwFLWG89vuzZRI98AnZh3AXEqlH8iLYnbw5DYtXGOmvWJINNK+Y83RhAN3
	 w84L34l8BeXnzRbXqf3UETrzxVg6WLYre331i0W1X0UrSwazJe6UimOVemesNs76zg7w6
	 9E8Ntd6uWIPB/mSBPMmv7uRWgeoFp6iXneVCZWnbd/0bOxo6SCKOnZ/qDw+tZ2xFJnPeB
	 vOSZaif+Xryo+9mrrug104oPsiTIVm6sCeJNum8VVOJtpNyE6W7AvreIbl342n8Mpi/OG
	 tKixrRVP4gtpWiAbC1N5CtPde0Eo1yHqK7xRpNBJPoWeeofpT6FsUCew36j/MOxayGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765466;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:From:User-Agent:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=exyqA4xjQHJ8t9SqDedkQRc8moWZMY9lB2uphlyg/ec=;
	b=u4SwkcGlIZxpYB1y3eI4GfiaR1kKw1kb/KYJosaQMNjRJQguvowy3IQ+pfNwBY54adwO
	 eDm8tmbzXsiqvk5koEt0rnBqPSbQYMn+P9tqVndt3xAOsUUlo/PHHrUwIFoxfc+EZ6avG
	 dWf/t5lEwNNL+IbUYZjQi704OXfettUxXoIRQ5hpNrqQih80iXpLzMzSaXS0uU0C3AAJT
	 rsB9oI97Yc1oqYBmIeg4G13KBomqzglvQWfRPE3UPjselMKJ7awdxwxdCR4o4mmvxg9Fi
	 5dChqYaIPvYOK4fUdOKn2+Nsr12zBuSF6UqaOJnK/JIzLwokovCFXFBEFBpNBf9mtxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=hisilicon.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aQBJ8MHJ;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EFF606A31E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 07:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aQBJ8MHJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=exyqA4xjQHJ8t9SqDedkQRc8moWZMY9lB2uphlyg/ec=;
	b=aQBJ8MHJprkEys9KsARq71TnWg1b+SkJLCo+KannvjVX0ckEamBuo0cnCDhf8rakTUP93K+x7
	1M3LaVSMu4s4dLJiVq0OS1WwxiGa9N8mSv+EE5tXETySWF6ZB06WaiWjJ42vzaEje+p+N8VXOPk
	dgz5qNat3d6MPTFfSSQ21c0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jbQPq32HQzcb49;
	Fri, 27 Nov 2026 15:43:11 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 6766740575;
	Fri, 27 Nov 2026 15:44:20 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 27 Nov 2026 15:44:19 +0800
Message-ID: <6B0934D3.3020302@hisilicon.com>
Date: Fri, 27 Nov 2026 15:44:19 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong.xu@linux.dev>
CC: <mfd@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH 00/12] arm64: dts: hisilicon: DT warning fixes
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/11/12 3:40, Rob Herring (Arm) wrote:
> Another batch of DT schema warning fixes for HiSilicon platforms. This 
> fixes most of the remaining warnings on HiSilicon platforms.
> 
> It's best if the whole series is taken together.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks!
Series applied except the patch 02.
Maybe I will send the PR in the next cycle since the patch 03 depends on patch 02.

Best Regards,
Wei
