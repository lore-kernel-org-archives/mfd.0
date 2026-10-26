Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006880;
	b=OJeUzGIDccLAlC1Y24zIlTf990nrbpkHo2zZbdjuT7TMhkSQhNMh7V0BpazDt3+Ncb9K
	 ITjRtNjQjHL0vD5s72rpWqxDJUnwz0dtgFpLMAu5aKS9IF9Wjvu+MccG/orMnh2cvUxkF
	 8SEmUjlOskOlcKihL6BxDnnxklqHLsq+gY7JKS5gZKxeeAdZv/+9qERR6BLTedl8OjCtw
	 qlQ4JYWoq/wlb38y04d+9IWtO7t9VCM2mRR3Uj1VR3rD8ZlxE7zYVWO223P6Zmkw2UPKw
	 ox1Fb1sJrGr4PSj39A4lRyDl8a21ASJ/95OkkX6BW4gvFnUijXJxeNqCphIYTsqpxWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006880;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=qywe0Yi/+oq++LNMQYKiGg4TEZMBeNNx2BnHrKwc8Sg=;
	b=WPi/fI/8y+667iO6nnyNFlNtRFjWvrBomKWpneFMlQWcyzMBlWBVN7PjDP4uFeTcDrc4
	 cBDhCD+CuRJe0qo+GZE1tOCBvN73F5OhSUAnYRc9RCwhaDNJ7+SnCCi42YA1pNjbM59/N
	 LJe+hAdHob9pJPY7kXIfZ9XOJaGm+G46UfZ8A/sWhyW8RekKllSaSRal0r4o6dAbBdSaZ
	 F/I3f8OwPBGqsviwhvxs7hNGppWlJtzXV6vWW6sDS6deCl25UkFBBeCG8gfQpx7BVgF5v
	 jXZU9GeUjpYCXlGPXTV2uRGX0B0bGCKFLDlSBmQyMV7fJg99AzSFzB7rkEEPFZ/wIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48939606A31F
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 09:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48939606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8DxOvAcHd9qwm0ZAA--.8632S3;
	Mon, 26 Oct 2026 17:27:56 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJCxf88ZHd9qI0wwAA--.37303S2;
	Mon, 26 Oct 2026 17:27:55 +0800 (CST)
Message-ID: <f2857967-ccec-4ea7-b46b-bfa3d3b7d805@loongson.cn>
Date: Mon, 26 Oct 2026 17:25:08 +0800
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/28] mfd: loongson-se: Check return value of
 dma_set_mask_and_coherent()
To: Lee Jones <lee@kernel.org>
Cc: stable@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, linux-crypto@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-15-lee@kernel.org>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20261021121245.3111563-15-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxf88ZHd9qI0wwAA--.37303S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrWxuw4xGr4xXFyDAryfXwc_yoWxZFX_Ca
	42934kWrykWr4qya4jgrn3CrZaqa4UW34fu3W5JF4Sga45AFsYv3WfGayUtw47XrZ5Ar1Y
	9w1DWr9Y9r1rZosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==


在 2026/10/21 20:09, Lee Jones 写道:
> loongson_se_probe() ignores the return value of
> dma_set_mask_and_coherent() when requesting a 64-bit DMA mask before
> allocating coherent DMA memory.  Check the return value and abort probe
> if the platform cannot satisfy the 64-bit DMA mask requirement.
>
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip controller")
> Closes: https://sashiko.dev/#/bug/linux-6685ee0c-b7ed-4f21-8800-cc705cec449b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Thanks for fixing this!


Best Regards,

Qunqin.

