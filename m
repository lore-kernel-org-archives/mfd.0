Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034847;
	b=AywShOoHGpIBsI18boL+tfAlatF/mUN20JDJpNsAWDxKWEhsxFK3WlcFq6/fuMKfBsOt
	 5hBhl7xBYuOxW5uGL6LHAgoZjHhcq575NnalK079l9iafoOB4RHQgdjg7soWaHZpLEjlQ
	 7PDACpf3+lL2BK10LMdp08q+MiVbYeo9mzhu6u/4J+Z/bhErkrutcdvBWZtHk1y8FdFLJ
	 owM4noP0XQeQGZguJJCV+JGR6zl5Jvtj+maSdAC2rJhd9RuCRzlk7oiLDp2may1zup9Du
	 mH3RaNjcZCFjrUMIC/WNFpq7kPz7c7wh2C41COd5p/wT8h1j+mp0HMW4PxYRmwl8gow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
	b=SY2qGiC8Pc/3Wv5DgUPexBYNPjIwrBRAm/NTuRF3mysxYaQdxs3+ej8zX3GkTU4uEFiJ
	 cQalNTtBsQcMS1sN8FrT6pHmA1cYDCy2qCvmQLj6sCw8yIY61MkYMXIqldUc3NvyNVbI9
	 iJouoaAE0q6ye6u5RJCclKi0VrLOilRdtonXzScRxPro7dPt6pbLhGTizZjkmz+9Sizbi
	 soPvI76mMYMaLpTkuYL8+h6RlCekA52mpc+F4j6vfltlWhjkYSqXM0gcaOanCESO60uiz
	 itTPkv62MWPC/Mq99bqmW4ykfqcGS4Ssp+EsTcd/YiOUHPnsC4Z0BTZV1hRr2JuFAXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jj48RMuW;
	arc=none smtp.remote-ip=209.85.208.197
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA4606A32F
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 20:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EA4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jj48RMuW
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3ae3cce89a4so8576301fa.2
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034845; x=1795639645; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
        b=Jj48RMuWV550SRCVjzEkxjXidxyVp1Kg6v88yFuC3KIhre5TUKH6ZyYaxmE3AUz7MJ
         5e7/nAhKHEMR3RKJE3Ajyyj5BdNbVrubh3CVD4PQc9iDEaVjfTY+DoT5h/ESueOYVh3t
         hJWUAEeqCyfz31w4a3UkslKs44tNOXCwaivuJ9nYxsm2ZRvPI8jjQHdPDu2nbw8h5YAt
         3dxf2KscT63Qp6duUHjrmPQ+XYr2nPEjqpu4kkhPeByDF/O6X/gvqFwl6MWjzlM5gtLM
         WYkMVCyx2pcroKYpj5roZlXAFVzYwmSK9QsC0pdLR9d4w73VX81rYcUSkSxyiW9Ijkty
         Ra1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034845; x=1795639645;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
        b=W6KMAZTwReiT6caw/95SzvoD7tHsZnBIeVLTuWULeb/41rYdxFDgeuvA8AHrFeKzVb
         yQP/bWWk2lNNLqj2Y1y/Yg7yHLZAHmXx6H0hRqi8FzoBp01r5+IX2ScG8mDFGb9R+Qrv
         d1iQrlp2dkqd5Yxw6B5wjQlrpDDL1oI2kg1w7hiVBjjZ8iamWSVhM6jk2TFR25qZH8c5
         w1tsEhd05GL6vIKKoLFlGi3mheDsb8rynMgK4UkE+KlHwOz7Xjhme7Iv3+JKofp2YF9m
         girGDu24WoDa10BmfNYrjbL7WA2fDyhRgCe7fXP0DcppUTKaSdzCJ6Qla4uZJIP1ZJBD
         1oOQ==
X-Forwarded-Encrypted: i=1; AL+hErFXod/rZksDA+GJZ9GM9PFjYgscM8W7fNq7WBkF5VRSTiI9N9QrOntzNOfeYbAyai7mmBc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9PtK6AtOL2lGg6nhAaq/iYzkoSf8ci7oxYzSnElbQOiYUGkfFj
	FJLBLsOdLctxx7zczSN7tZvyeDNB6ajl07yTiqehiMEdgajHplzZh/fFeu3BmMLEznC3Y/Lxx6g
	EUK9B5QgLLw==
X-Received: from ljvj19-n1.prod.google.com ([2002:a05:651c:43d3:10b0:3ab:3660:4afa])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:1a0f:b0:3ac:a2b0:ac56
 with SMTP id 38308e7fff4ca-3ae6730a895mr13584131fa.29.1795034844920; Wed, 18
 Nov 2026 12:47:24 -0800 (PST)
Date: Wed, 18 Nov 2026 20:45:32 +0000
In-Reply-To: <20261107010356.39d9eddf@jic23-hlaptop>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com> <20261107010356.39d9eddf@jic23-hlaptop>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118204532.257423-1-dbalint@google.com>
Subject: Re: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Daniel Balint <dbalint@google.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 01:03:56 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Hi Daniel
> 
> I'm not necessarily against this but when adding monitoring components
> to IIO the usual question is why not hwmon?  What features are not
> well supported by that framework?
> 
> Note historically I suspect we accepted one or two drives into IIO that
> would have fitted better there so precedence isn't a strong argument.
> 
> Convention for these somewhat borderline case is +CC hmwon maintainer
> and list as well as IIO with that explanation in the cover letter.
> That avoids any last minute surprises!

Hi Jonathan,

Thanks for taking a look!
The main reason for choosing IIO over hwmon is that for On-Device Power
Monitoring, userspace needs an atomic, untorn snapshot across all rails
(up to 64) over the same integration window, triggered on demand from
userspace and read out in a single buffer read rather than repeated
per-channel sysfs reads.

Reflecting that requirement, EC_PWRMON_LATCH on the EC is a global,
stateful command: a single latch simultaneously snapshots all onboard
power accumulators and resets their accumulation window on the EC, so
individual channels cannot be latched independently. As far as I know,
hwmon only exposes independent per-channel sysfs attributes with no
multi-channel buffer or on-demand trigger ABI, whereas IIO's triggered
buffer interface is well suited for this kind of pattern.

CC'ing hwmon maintainer and list to keep me honest.

If there is no objection to adding the driver to IIO, I will clean up the
custom energy_value attribute and replace it with the standard IIO
triggered buffer interface in v2, along with addressing other review
comments and including the above explanation in the v2 cover letter.

Thanks,
Daniel
