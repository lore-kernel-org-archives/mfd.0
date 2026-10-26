Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984933;
	b=B6fHolwGy7+z0oLiiH9xAV+xLDWPKrPEXvQitGEw3qS7mn92xiur+kMgCUEzvi6jp+eU
	 a02SCRqjd+WePGfJETyD+GBN2i9AovZNbHcwcHr1kROp57hhPhQK0ukp1nAFSopCzAYUT
	 Ri1sLP0kD20Pn+v08EjwIoHQ6rEPdBjh7x4ezyQaqNFHlHM2IwzzyHXHTjHgUgUxBwg+s
	 qACMPefbTioMH4a1ZDn22tjuarcZUELGaeVgYfHsMOFhjLdslp7B+IzbbBaH2QwQabMqE
	 XHiFoXDS189A+5c3YpildVM/7GDDdNXPLYh2raz3LsyNMfagxgyWtlxGAgRgl0ZnKTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984933;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=uAVUMEmtFiZlBzh2Kd9CRP7rcnQ+Nf7H4f2OSYsP6pc=;
	b=IPNxCsGODbqAxuOV5V8gLN+ZzK/lVPNCGmosFcZeedAP7HcBEhVg3umQvz2fkvyiQldo
	 /kMZXpiX5Nl+Ug31tQnuCtG0YdXhMqVPAQHDDnxbJYo0PhJf1eXnBfaWEEFjZ4MsOz6aI
	 QuWn4fK7LBbjpZalPscNVeR6TuhD1d4LPDLCfnhbzf2tw1Tu9HLISkr747e3hqHzBw5j6
	 6XvPmZUWxRcKRgU2PdWEC10FI/0U6lCtY/06h343W2AS5zQRpoLBo/HnjtiiIXTztwLTI
	 DmqxgBQ9t75zzwJNAedg52JYkNQmrw4/lIyD7kU49z0fvuKzs4wHv5zozpw1zkEiz9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F81A606A326
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 03:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F81A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxpvBix95qVloZAA--.8358S3;
	Mon, 26 Oct 2026 11:22:10 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJDxRs1hx95qDzUwAA--.22181S2;
	Mon, 26 Oct 2026 11:22:09 +0800 (CST)
Message-ID: <22766db4-fc47-47bd-8062-239f3873fc84@loongson.cn>
Date: Mon, 26 Oct 2026 11:22:09 +0800
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
Subject: Re: [PATCH 03/28] mfd: ls2kbmc: Cancel reset work on teardown via
 devm_work_autocancel()
To: Lee Jones <lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-3-lee@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20261021121245.3111563-3-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDxRs1hx95qDzUwAA--.22181S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGretPgBWQABsl
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1fXw1fCw1xtw4DWryUArc_yoW8ZF4UpF
	Z0kFWjyrs5Ja4UJa4DCryI9FyYgr4YyFW8KryIq3W7Xr13Kwn2vF1FvF9IqFn8ArWkJayY
	grW3Xayxua45ZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1LvtUUUUU=



On 2026/10/21 20:09, Lee Jones wrote:
> ls2k_bmc_init() initialises bmc_reset_work with INIT_WORK() and
> immediately requests the PCIe and GPIO interrupts via devm_request_irq().
> If an interrupt fires and schedules bmc_reset_work before a subsequent
> step in ls2k_bmc_probe() fails, or when the device is unbound, devres
> frees ddata whilst bmc_reset_work remains queued, leading to a
> use-after-free in ls2k_bmc_events_fn().
> 
> Initialise bmc_reset_work with devm_work_autocancel() before requesting
> the interrupts so that devres cancels any pending work after the
> interrupts are freed and before ddata is released.
> 
> Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
> Closes: https://sashiko.dev/#/bug/linux-3089d131-9fcf-4753-b183-eebe0a6e020e
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
Acked-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   drivers/mfd/ls2k-bmc-core.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 23c774a09842..e245bdee8226 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -12,6 +12,7 @@
>   #include <linux/aperture.h>
>   #include <linux/bitfield.h>
>   #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/errno.h>
>   #include <linux/init.h>
>   #include <linux/iopoll.h>
> @@ -376,7 +377,9 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>   
>   	ls2k_bmc_save_pci_data(pdev, ddata);
>   
> -	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
> +	ret = devm_work_autocancel(ddata->dev, &ddata->bmc_reset_work, ls2k_bmc_events_fn);
> +	if (ret)
> +		return ret;
>   
>   	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>   			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);

-- 
Thanks.
Binbin

