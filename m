Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118134;
	b=B62Ya6a8BOORkHUfa0HaJSL6esU7ogL6bVBe2QbIg2y3y+i5u1EdF0x5t+R7MHAGuSNl
	 AqdbI3s99GwZUrYkWRyTIhKTxbnMy1/A6rxWt2GbL6w7byablf1+ExllAh0v55fHzYIxs
	 nshrw+9V/vxdpwoKRevBEPq3fT5sKhCjkqFmyLZWqdolNOaPcow0qpmn39/Q3nrAFQGFO
	 nktu+9unZlJOov2gklVt8F8eC8UooO5+N1zcNfBPrmKB7XNkr0Xvzbqb7+OazxkM5XDkJ
	 6W0SV0IbpDsu+bAv1xrKhI4IyXG+JFvn06KEo+UhUA0s4nnBZDJ/qJUDj5MdhuQEaRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
	b=DExFikjBeRAXJq/zw32VptkhtBcf5nJJ+YDvKONdOH61LAOuMy4gA2dhfUKa5ESSDqKJ
	 fbBjaEX15cv4zCVnoxJ48wZZnsKocNx/KsHR3usZlfqNwm3lOTe6VeQtp2e/6FODJJi0B
	 aH8ara4mrottEAD8JqJ9Tt9V1//fRTpBaxRRlCx9AlZQVXOynLhVRQG1vsx5Uhs/+tSLm
	 WR1WGkcfMyjrSQ6wNCUya7oXouUBvjCvbTw0hDjWExVjmi9y6JBI9qc8R6QcD0yibJJE7
	 KsHX7JdA32ms22bJVFj0maRaNbCuIlHnNqHN2lrpuTvE7unZZP/Bp1TrIbDE6qw7zvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIFFFMVp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E17606A31D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 16:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E17606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIFFFMVp
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0d63f60bcso32187157b3.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118133; cv=none;
        d=google.com; s=arc-20260327;
        b=YgE2ykOwD+XeQHcjRHTFafiwLDL43Rvxk5l3DBAMuDE1p8Kzg4SmDQp+flTQ9Vw59Z
         Qsbi3kl78RZW98WC/nRRmgW5R82UgKy9GgA4UmvcWrZrbGMNxp3XbcvJ0gPFXv7+Yl8s
         AYpR42or/2EfIMEePZuqU1hprUvGxCO37RjKuWtYggNUHvhIq3MO8BwiJBIak02HHxVx
         8sGbj5x0N8w1gT1Udl2Fy/Vk+/WEQCbkaLj/CbsU9NMgADWiY88sZrGtnOtGJpNTPuFU
         hL6Xll5cGUFteGuTlKS7SFtyTAoxxaRs/ed0m6QeDCkvllkGzDsEiotIc1owMEWACEhi
         4CwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
        fh=SeaihVugvng4ROP1oMo6WoU4kkDGqpqjbI2GShCinfI=;
        b=VTAZLEI2kIDH5kDG4DLnZnbXKn9KqKDoH3Wkg95kz7J0+/mZ1YXr2wIdnbRp/oZVE+
         6HUVD1kg4lnLk7vo1SD5mlSUQNh4gUDPUWrMt3OJt9HaJ5P92t8S5WN1rX3k9B/jD2Ik
         6XM2HZW2Zu/ClvjBFUCQat+otf4SCMx4QUfJrzLdFO/3Ev58CGLXbvmqlWS1Jwlm+1oK
         5JcFRo758dJb81nizI+4Zthv0RYispgTzsxK81uxVGVRAui6HcEntBeAPTn4sNuykQ/0
         yWLTW923Jq2z5q7cKzby/lWxh3mmIwgle/yj7DL0asHOs944FSbFuOh0lLQMz0fbqthw
         qA6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118133; x=1793722933; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
        b=iIFFFMVpIXK8f3ufW+eoBs7STdtx0PNmPfH77vKEL+HECAA20qZS/bwayVbWMrXaLf
         YIFpB/UL5iGAtbDWIZnjxLrjj/E4uPoXIunczWbc4c0L5q+/qOA2LyEpMY7ARo9hEEiJ
         CT1VTNhLquKBik/SHx0nKhyYBwNGjXWrg7B0AC1mbJCgqSRC6fdRX5ftyoK9iN34ZcZn
         uZDTSO6QuXZ6dZl9shPWor9w3wvjP/W4j4AXtLy6dwBefd6um0Qq0BKFHnqUOE69hrjO
         4sm1MIq4RcNXY7xKELxLlQ0dndmyBC/4uJax8Du+2GRso/Ce75n4/sxNbdZZUeSAAp78
         CF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118133; x=1793722933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
        b=z7dQXJ66ulbQqVYfhrhURu4DDQLETnbKhMX5e1oXNCP/8kUW/2IxODc3ErFD9CJt0C
         A3KP2k2wzhjVO+38/9IU0NWFLEYknm6jwjrdS1HE7KRQYErUGEouVgMojhLrQ93batRv
         xK9kGzPmgiOOOYgAx3nc3HvlIRTY1xPOkQCam7deby/AWDkYtabGigwUoL74nOHjnVsQ
         xa7PjNXclYJZFQfzvB8FRG16fBlUO5yxA/B2BnNn03gljfobAif4Ku3k216otbuqm1kG
         FUY8DaF5bRVuR8OPvhMm0uSJ4p08YuPF6QGRK3RTvbPgqB0P1Hu7l/RpVN6ETidK89vT
         zXEA==
X-Forwarded-Encrypted: i=1; AKwUvBxMGAkjlqnQGcom5+8/aqgFLTG/8gJWSRuVgzbKG6KuFi79/5YEvQ4rYYzGZPLfuDabNME=@lists.linux.dev
X-Gm-Message-State: AFq9FYIHy+76NWk6lEkOTtuBf6b/OUuVkWK+o3mot4MHqfGAeYP4N7Yi
	PnkIJ48A45+MeGP5L4aKl5wmkR5s/+nJx20SZsUUz+2Ridvz3GAUKyRC0dmAdYoCgj2ierwINAP
	wf1+N7qX80XSbe4FDShTLAcoZtXeJsao=
X-Gm-Gg: AYBFou0l8E6vZW9TpjbO2s2CYwsFW/VznUHEZCI4l9RTBskwAG/jEATG2L61w1hBmc7
	6yctGrvJMHSiUn7FvGSu+kU/cPpB2AQkfiXTgEmTMTbr1M/ETEngJAcuKYOIobDdcIX58i0g8Uh
	RhDalSHHp//c7GNVHKmjP9H9NiVAk8amiSFxKCoYEJRKLUy6tn2tCgzttlKKg7tE5PMqIWtdJ3d
	0XP/zZsB2vAVIOYbza70zoDCRU9itWgY16XUdXZ81eDxC3L7Nb0AzkU/njfoxuGdmvAYYsctxUy
	YanYHY8Hmy8FQhZfr+nd02mBM5fh1RKV9RTLe32nJcsYUfd+lRZqkbdtXOQDiqMnhGOlp5oSOfL
	B7FK0+rw4AsV3dmQeFhH5H2Bs9tj+W1tXb3L95RHX6JxHB729BGSYv+kHjw==
X-Received: by 2002:a05:690c:7108:b0:8a0:76e8:c738 with SMTP id
 00721157ae682-8b1667b96bfmr81615047b3.0.1793118132815; Tue, 27 Oct 2026
 09:22:12 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027024609.117371-1-lgs201920130244@gmail.com> <c04f2ba8-fc83-4118-a26a-76ea8cbee518@kernel.org>
In-Reply-To: <c04f2ba8-fc83-4118-a26a-76ea8cbee518@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:02 +0800
X-Gm-Features: AclHuK_iX4SH8qBhnH28MTM8xZlzfsclFjVNEOpTxXSJI2-mCXDyAbwNghV1urs
Message-ID: <CANUHTR_VjDZiG=igkaiy=Pj-gLKchTwA-OvJ4KjVoC-nDX3YTg@mail.gmail.com>
Subject: Re: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, John Stultz <john.stultz@linaro.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 03:46, Guangshuo Li wrote:
> > hi655x_pmic_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. regmap_del_irq_chip() disposes the
> > child IRQ mappings and removes their IRQ descriptors.
> >
> > The hi65xx-powerkey child registers interrupt handlers using
> > devm_request_any_context_irq(). During child device removal, the
> > device-managed cleanup calls free_irq(), but the corresponding IRQ
> > descriptors are no longer available. As a result, the allocated
> > struct irqaction objects referenced by irq_desc->action are not
> > freed, causing a memory leak.
> >
> > Remove the MFD child devices first, allowing their device-managed
> > IRQ handlers to be released while the IRQ mappings are still valid.
> > Then remove the regmap IRQ chip and its IRQ domain.
> >
> > This issue was found by our static analysis tool under development.
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
