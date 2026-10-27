Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069211;
	b=ZP/NGfZxM7SgVt3CDQiJggMO01yubD8Tss6p9p0dDc04vwdZzH9XnjWL1thMbpLyKCQC
	 g3etq9ggDy+3Em5tiW3RtrioGCHxUsD71z5SyB9vk0hJLORFql0bh/Ewqd7a66Cn4xQD5
	 C8AGS5lGMMRlbMLkBKnfyfgyOFf/IyEoqA+a51c349KWK521nmPPwHXOj/Fz+IEZltL20
	 6KpF8CwZOfILt2xFuVEfmdVApRtDVQic0Jn9ow+6pbN+CL52PI7o16mNqiJQtBYCfXLSu
	 10p6U/Prm1MvgJrHyZlPqmp3G7ueNK+ofjJzXEwrAa1+V+cvrfxKr4MCPmsoq/Pzw0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069211;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=tJccXRA73KxCPHa334RsjIMd6gOUDXrizq4EVOM7j+0=;
	b=NaRupns0m3AnrUCawIv9nwumHZPkwgL50zqoupAtDxW7YIuRg2UuvfGX7UWsAEHE48TU
	 CYeimIhiOUVp5OSCGEObAc88iqLWeJPbDvr8HryXlickfSxDAFRnXc2s3FgcOCr6djJ4E
	 BCMNYI/WIWpctSzmHt77QkcFK8vAEr60SWtCpNcLdQFt77VnIn6G3T15c2CxOZVyx6Kde
	 oPQFmf6wpqdC1hw5gt7N91/gxXUV9sf3i5wUOYP7dTuTfeTM4sByjnYvjuMRtvmXZPU/r
	 Cy8VQH6JBiExkSO4+h6Ph0AtuDkhUspU0gvoAwKPZRkwJY6WPICpe95NIIHFxeWGPOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5C5606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 02:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8AxntKXEOBqya0ZAA--.8918S3;
	Tue, 27 Oct 2026 10:46:47 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJAx2c2UEOBqy4cwAA--.36117S2;
	Tue, 27 Oct 2026 10:46:46 +0800 (CST)
Message-ID: <33132214-21cc-4ea8-9eb4-022ecd0659c4@loongson.cn>
Date: Tue, 27 Oct 2026 10:43:59 +0800
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
Subject: Re: [PATCH 18/28] mfd: loongson-se: Zero-allocate driver data and
 initialise engine completions in probe
To: Lee Jones <lee@kernel.org>
Cc: Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, linux-crypto@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-18-lee@kernel.org>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20261021121245.3111563-18-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c2UEOBqy4cwAA--.36117S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrW7tr43WF48Wr4fZrWrJFc_yoW8tr13pr
	sxua4jkr45tr409an8JryUuFyY934ftrW7Ca9xtw40yr1DJ3s2gFy5KFyUWFWDArWDGF12
	qFykKa1rua1FkrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=


在 2026/10/21 20:09, Lee Jones 写道:
> loongson_se_probe() allocates struct loongson_se using devm_kmalloc(),
> leaving the se->engines array uninitialised until child MFD drivers
> later invoke loongson_se_init_engine().  Meanwhile, hardware interrupts
> are unmasked and se_irq_handler() is registered during probe.  Any
> engine interrupt arriving before loongson_se_init_engine() runs causes
> se_irq_handler() to call complete() on an uninitialised completion
> structure.
>
> Allocate struct loongson_se with devm_kzalloc() and initialise all
> engine completion structures in loongson_se_probe() before registering
> interrupt handlers.
>
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip controller")
> Closes: https://sashiko.dev/#/bug/linux-ad9310d7-13b2-4a4a-ad7d-78a4c612c78c
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Thanks for fixing this!


Best Regards,

Qunqin.

> ---
>  drivers/mfd/loongson-se.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 9b531e62fb85..187ebbed0422 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c
> @@ -106,7 +106,6 @@ struct loongson_se_engine *loongson_se_init_engine(struct device *dev, int id)
>  
>  	engine->se = se;
>  	engine->id = id;
> -	init_completion(&engine->completion);
>  
>  	/* Divide DMA memory equally among all engines */
>  	engine->buffer_size = se->dmam_size / SE_ENGINE_MAX;
> @@ -199,12 +198,14 @@ static int loongson_se_probe(struct platform_device *pdev)
>  	int nr_irq, irq, err, i;
>  	dma_addr_t paddr;
>  
> -	se = devm_kmalloc(dev, sizeof(*se), GFP_KERNEL);
> +	se = devm_kzalloc(dev, sizeof(*se), GFP_KERNEL);
>  	if (!se)
>  		return -ENOMEM;
>  
>  	dev_set_drvdata(dev, se);
>  	init_completion(&se->cmd_completion);
> +	for (i = 0; i < SE_ENGINE_MAX; i++)
> +		init_completion(&se->engines[i].completion);
>  	spin_lock_init(&se->dev_lock);
>  	mutex_init(&se->engine_init_lock);
>  

