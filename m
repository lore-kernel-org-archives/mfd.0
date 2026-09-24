Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA547D460
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251245; cv=pass; b=Sw9aoOEFMmFdTLA1CSjWwBzaQaBBectizt3OKaLNkO/UNaVYfjd1PYYwHmXjSt1Jih3QYHxOsnLhsqaIaQz2Mlhr+KKWUMwge/Tbu+mN3skK82Es9tXC2Fj+/UGjoTHxuR5uqiIU5uj6uL9UP0BLgJn18nkXnEUKsMzoU8rqwng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251245; c=relaxed/simple;
	bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQJAQg8e0+yauqPcry1ZURPO7I6FGg3AlO1wdjFLvMpDYnZpGVWNnneXPa6gtn78Ub/vQjLmXS64V+lJFlJ/2pBcXre0csCLUZaUx9WSbMhd55GFNAnJ9ctAENEcNzM4U8CedfmFVZOARZa2dkKuHEYsGQ+JaE21r2PAgUD6rs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNkFctAY; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNkFctAY"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so2214741d50.2
        for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 05:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790251240; cv=none;
        d=google.com; s=arc-20260327;
        b=gO5ai9D086VmkRuRzBnmDsID0bby8G0aan2eq/aF4rvZrRlvxnPxcwrqVxZrig8DVG
         B80ioAbO97o5+lmSyIpzyYtpGWtqbE12spG2ctq37r49/1DtjlF3XTpOv54RCtoxXXyY
         /N/U9vf3TAmWZtnp3a/Zm4i7jYB6rgZy02IwqX2PdrYJ2k1biHmsdzxKkZ+imUsB1Sp6
         Hh7HpHj7bOU9Abwvo0S8dq+TBt+hrBWgw8EOXqNYRHGlm0EMsudF+54xuoZmPQAQA4PV
         /FpMecqcb9HgTtiUlntTZl4O7ej/Ox7/0DweHhphIk+GdJu2dMDblweZ3jrnw9XfpfMl
         nB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
        fh=ND/CV2HTa0fcBfRDaPBXkEutyQPuCCJwGJ8b88JIGNw=;
        b=BvwZMsiIzO78e5R3ccbMuBkWOWU+NMnft+tCEWbIg/JBDcJfNDU41HmXOGBTi3NHNH
         TXdcpB12pNr7gnJJaWs7YeFUIkGzEpAtIuIBPAxFIc7+7iuiO7sRZuduPg9CWrt64kWA
         iny2U3TsK+YGADKsXJK4QvuIUajQu4eci+nG1z/1w3l1LteCQdk8VQzo0TJB/dS7UB29
         GzXmU4zrVBP7egVkAyRUDjDakXUHQtlJNYdqKU+Quzi2D7oK49K1HYnGs3NXXqE31dh8
         Y8Z9omck21pulJh6eWCiXnTr/MYMGsqf0EkduFOJOXn8oNDaIfGW7w8+nVq1YSVNgEuh
         3cow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251240; x=1790856040; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
        b=JNkFctAYmk1DrafEy3bzwjjOPC/YsbQQubsFAYJ/w2vmrBUfW5bYSXBa8AkaxlJxP0
         /egwjLPEA7MPUmrLqo4xeLVgYcozgkYdcSK9H866gSurR2DrksumsLbjWBSwvTlNrPo4
         w6scdnK6oGreTzzzv+1ZAu+tVR5YyxjfGagAzEdFKkDJIrldmhSLpATqHS87RxzNHZrh
         /WDF+aRmM80s5lilR3EQb1HFzyAdC7tCXfIo8JFO8WjePPfJWfZKlHNWHOMn84g8uobG
         JnJHPLJMnngX9+jBrSZAZhPvOVW4UCU19vah5yFuC3hKpiC1PyFPHC6ODUGNc1DOeF61
         KGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251240; x=1790856040;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
        b=XqAlndl2KKNE1/p7q8RnIoo+xYieUTC363NBqQv5Xcv6XDZLmZuMKpxxbGBplVrx8i
         p9XZ4Q0Ase3E9pqVbfgd0xavrdcAoz3AiCl9pOZG1WjXJDlHndGVw/wUKJ7M1BEox7UC
         LChElDAA+y9QcViSqzQ2dx+eBBeDBAOXhUYgAnnuLou0g5q2HT45kqBiKbRf0quOLRqb
         R/VoNpzoeFAYhGzpXZGEsRqUdr7m8g1VTWoOTKa+4UDxx/jICq1ccmVX6F0m32NWUvzq
         iN2OdIN6K6fam/Uf91H4UUHWIFv/RYDcFuxGFNFiPmFguVtEwUbevKkwoyUtMXAsxyau
         d6xw==
X-Forwarded-Encrypted: i=1; AKwUvBwjjlUJwXTLPhds+owE4Sd7CGcOo20mETQPi8i1YSwk6+lT+O/v/ZQH7tnjsLhf3KR0g0c=@lists.linux.dev
X-Gm-Message-State: AFuF++kqEK0ml74UWiJPTuFCaoVERxgkjVJq5sHwyH6aM9R2DTs4VnHe
	yGGHEFVfisRYPVVBuqCUQA2JSODzTCQeI3jY7GsysWcEdKUu8AwqDgHwPJW5Zd+np4d1/yhoanV
	47bDb663QwPao0N4fiNybsij1rux6kVU=
X-Gm-Gg: AYBFou0RYd7sY3xycQTEbRwZG63Qa7ZBYmreiCKonbosSLa1bcPA2FMf2fMh2DMDM6W
	qhKYywYRw8SJGz4UUHXG4JCeC/JTi/ByFqrQJWNxmRmwpoxEe5jP4LlU5yXZdeskTUHTodIzNr3
	Wt7P3nYj+1Smib+5GUxFzdD0Us/W3IP37Ei1UbK+sQZnqNIgBPegLsw6iLDOezbZiN3d0Zzn+Ux
	0hPimeTDNsbo4xr8e7Y3DuHhajEEMuTPU4LyDEXlKlSa2nKy5eSn4eJQlE5cZ2qa/iLaWtAif0p
	0QsoM4nCEKbWHswJlSMFuYTWAeQZPFFCUq/GWxrsPHkShO2xb9AxHNk0/Q==
X-Received: by 2002:a05:690e:c46:b0:673:938f:684 with SMTP id
 956f58d0204a3-673938f08d6mr168889d50.56.1790251239884; Thu, 24 Sep 2026
 05:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921104058.353748-1-lgs201920130244@gmail.com>
 <20260921110512.GS106095@black.igk.intel.com> <CANUHTR9gA-mKn8Y496Pty4_Fhu3BSSyhXWrmiod1WvuVdQjkag@mail.gmail.com>
 <arJ0pDlXpdlsF0sT@ashevche-desk.local> <20260922123315.GF106095@black.igk.intel.com>
In-Reply-To: <20260922123315.GF106095@black.igk.intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 20:00:29 +0800
X-Gm-Features: AclHuK8ajLz_1mV9OsX5cTlVyofvFYTK8P24xEanxXIUMhPnGnhiLT98a2I6OJ0
Message-ID: <CANUHTR_Su1KxOeB2fJDwzVeyW4WpnWuzTYm=6Yz4z12Pr6GugQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Andy and Mika.

On Tue, 22 Sept 2026 at 20:33, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, Sep 22, 2026 at 03:29:24PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2026 at 03:59:32PM +0800, Guangshuo Li wrote:
> > > On Mon, 21 Sept 2026 at 19:05, Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > On Mon, Sep 21, 2026 at 06:40:58PM +0800, Guangshuo Li wrote:
> >
> > > > I think this could use devm_mfd_add_devices() instead.
> > > >
> > > > > The issue was identified by a static analysis tool I developed and
> > > > > confirmed by manual review.
> >
> > > Do you mean converting both MFD registrations to devm_mfd_add_devices()
> > > and dropping the explicit mfd_remove_devices() from the remove path, like
> > > this?
> >
> > Won't work properly. The rule of thumb, it should be no 'goto' after devm_*() call.
>
> hmm, isn't the unwind done in driver core and has nothing to do with goto?
> Maybe things have changed since I last time looked? ;-)

devm_mfd_add_devices() would remove the children when the parent
device's devres is released after probe returns an error. However, the
current error path tears down the debugfs, LTR, clock, and IDA state
before returning, while intel_lpss_remove() removes the MFD children
before those resources.

Given that ordering, would keeping mfd_add_devices() and adding
mfd_remove_devices() at err_remove_ltr, as in the original patch, be
preferable here?

Thanks,
Guangshuo
