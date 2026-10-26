Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989393;
	b=TB+kxQDr4m+JY4qCpRXkKQ0E+1HwBBCnhZoTT9aYfMpY0aXSdolddAdyml2HKMrU8SLo
	 kA1ZhtZ3F1mVCYrXbSAloc5TOiiu4/Ws9ztkh6Trt0kmNxXAo40h0rnYeJNGaeJEfK7XS
	 qJG3is4gDCWpOhKsf85Ajlv76fY0FeBiEjVx5ZQjMxKDGvcGw4+Mnd8unZ2R9AKF4UvTI
	 9b7skqsXcUwY2g0Q+BIleijC/aJBgJctkxhZ50WmNBQoWc13MsFKUTvOH3uP2Z/tvpqwx
	 ioodLfDTuxU2An5F7s6UR7VC+h1Rl87KW25LB8vzrIznPuqsbQ/gdbV5l9FOrRJyUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989393;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=fkjASHhjHD9dtcL2FTJk6qqQRP9PpHcbiVA7YApl7Ho=;
	b=sMGq0BzrHQSgpV1ouOGEGooh6ZphsQaxlGZrvkJlXOX7cFaTx0uaGhrfKdwk3+UN3iVt
	 sQY3GEeDVOkqkGXl629VHo2e9pxy8Zwj+Wd++XhwJCrQG6Z3RXKOrko5Ja7aECc9uLLI8
	 tyx+nUiflkCbJmJ9g1nJFtMBVDfpIboLpsNWUB1CmmE88uVBmrvjxfCcMnF2ZLOiluGq/
	 HU1WrCXquVAKkhJby5hSU0MYEp/onNcQGgS2x1+rvuhp11KjuO88vjMheUgpY5ruD2As8
	 XHezlp14Q7imf/ou6YPTqz7pAAVcHMRVEoWfiQtqdRWBtK4VXnKTnWQsoOunRORlN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6568F606A31A
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 04:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6568F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Axj9HO2N5qHF4ZAA--.8494S3;
	Mon, 26 Oct 2026 12:36:30 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJCx9czM2N5qODkwAA--.7944S2;
	Mon, 26 Oct 2026 12:36:29 +0800 (CST)
Message-ID: <b5044747-0f3a-4a63-9446-829379f3915f@loongson.cn>
Date: Mon, 26 Oct 2026 12:36:28 +0800
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
Subject: Re: [PATCH 04/28] mfd: ls2kbmc: Allocate simplefb platform_data on
 the heap
To: Lee Jones <lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-4-lee@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20261021121245.3111563-4-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCx9czM2N5qODkwAA--.7944S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwvHwAAs7
X-Coremail-Antispam: 1Uk129KBj93XoW7KFy5CFWDJF1rJF4kCr1rGrX_yoW8tryDpF
	ykCa43AFs5KFy29a47Gr1kuryYkwsFv340gF93Xa4S93s8J348KFWrKFy8uas3trykJ3W7
	Xr1DtF45uFZ8ZFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2
	jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0beOPUUUUU==



On 2026/10/21 20:09, Lee Jones wrote:
> ls2k_bmc_probe() declares struct simplefb_platform_data on the stack and
> assigns its address to the display MFD cell.  Although mfd_add_device()
> deep-copies platform_data via platform_device_add_data() before
> ls2k_bmc_probe() returns, the shallow mfd_cell copy attached to the
> child platform device retains a stale pointer to the expired stack
> frame.
> 
> Allocate the simplefb_platform_data structure on the heap via
> devm_kzalloc() prior to devm_mfd_add_devices() so the pointer remains
> valid for the lifetime of the child platform device.
> 
> Closes: https://sashiko.dev/#/bug/linux-4e2dd9cb-310b-4bba-b305-ffacc738285c
> Signed-off-by: Lee Jones <lee@kernel.org>

Acked-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/mfd/ls2k-bmc-core.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index e245bdee8226..3e3bc835262e 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -470,7 +470,7 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
>   
>   static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   {
> -	struct simplefb_platform_data pd;
> +	struct simplefb_platform_data *pd;
>   	struct ls2k_bmc_ddata *ddata;
>   	resource_size_t base;
>   	int ret;
> @@ -489,12 +489,16 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	if (ret)
>   		return ret;
>   
> -	ret = ls2k_bmc_parse_mode(dev, &pd);
> +	pd = devm_kzalloc(&dev->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +
> +	ret = ls2k_bmc_parse_mode(dev, pd);
>   	if (ret)
>   		return ret;
>   
> -	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = &pd;
> -	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(pd);
> +	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = pd;
> +	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(*pd);
>   	base = pci_resource_start(dev, 0) + LS2K_DISPLAY_RES_START;
>   
>   	/* Remove conflicting efifb device */

-- 
Thanks.
Binbin

