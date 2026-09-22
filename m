Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A25226AF
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063998; cv=pass; b=sD7r+OMeGaJv+6sVrcamvp4zV1qzGp1QmGdU7FDpGEpGxn4avpVw85QIuRth97WoSnJ/otn/OdiTqTNhlPMrcHDAjb9ZeWEUsJS1DbuNiYCF0kjWGeBeQ5mkQDQ6v6BkxoIyNVqRGO6+/wP4cvX5hWBdBjm2nUm2VV1zlB0RL14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063998; c=relaxed/simple;
	bh=LV/LVjKM3hxN9GZjkxURfw1FVzLRvHD743trx/7Cv6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2L5aXyZRh6eLntoZo8WXx+d+UbCrPhUO2N2UAqOrjvOIi2SHCYzc+0uD16wrMopGK/fguusL977RHyFZ4tlwHGA8kNrkePQuXdNq7TNVOlG5CEl3wGC6d4/uFanML31bRZLUhKEDX4ge4IkP29VhhGPrFktuzpbKxiicHGvcUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxWIrwS7; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxWIrwS7"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab1ef11so3378071d50.0
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 00:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790063987; cv=none;
        d=google.com; s=arc-20260327;
        b=l6NfrcaQO2tWREe8AcPS78oWC1mJ2k0gzdkIKayVbRFU/XApFJ8capDYk7i987EcXp
         /MPP//AJciwcQGvwqeiWJymYShL/7wpOOP9H4RSOTx3jzKpOvcd5dzrD7bcxQX3zR2Pt
         4h8s1qHDalW1eMaE+Z8jNbYYOIoRZxdoG9B20vD1kuX7Gz/GRyIAuWI+cRPFtfr6TEWr
         vgR53foTzcgwPmA/uCwCh6wvJUq9QWMgaR6AhqauQui2XIBxWa2PXFmI3o+bjCuo4snq
         oviggVg1rq0DWIinzhNir2Q/VMMKB/F4s7DHk3YFyvfkbn8GMEw8OUELR9PH4Nn1+j2B
         jgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dP1zCMCErPeK9F1TnlfMVGvOu9U8paGR+gGJEZKdb/E=;
        fh=h0vQhxHkSWIkn5PkjdtqT8vBt4KIv0CX9lMG7YMTKJ0=;
        b=mpJkRrbtQk0EyFl9x7BYAWtIHCfij7Bah0Rwa+cL9gpBECp/sATny+e8v0N1gmhseC
         DG3N0I04OV58rPKB+QF9A3JfMzKIw2FKD44GxQLMfItIpkeN1nJMyYafvb3hBlZ3rc40
         7Z25GkW55p+Z+GNSkUtKcUXk/nFiQpJAMijR+JtIxDxePw2w+KfN9Coi3AtuaH1lJMzj
         kTo6MZzz3yYVCdl0uIjhOHp5zWdRIvG5PgEmbWTimE/Myl1z8DUTXzEuvZsb52MBAwqA
         0iZkgdGJaOlu/F025vWwqtUtjsg9qK9rwOvA79GXtN1fINOf8tzQixdjOedbibyJpkww
         fTKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063987; x=1790668787; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP1zCMCErPeK9F1TnlfMVGvOu9U8paGR+gGJEZKdb/E=;
        b=lxWIrwS7kmrLq/gDgkxOeKS4cZQInNeR69p19W26WOF0e5qHW/p4ZZroWZZPcqZPLx
         ZGtNzsIxusoS3Ge4W033sTA95wjBKs3kROpkalDW4M6LTDabUfRcqCiHmcjHNZ215nUV
         9ybJruu4swpIVPHJ0CnscUCbB9ockYxRatjvgCtZxM7xi+4ON4YaKs54ZTfwCh/7yuKg
         7kjkCN0Kn+0DBFTM5ST0QiT/DHV+i4XumH2i3DAAEfcg9/7M7C8yk27PEyQRbSUGof40
         c5mQpaObwud47Aj1qRVucF0CGUEOSimiQpFzggDY6/zpeO6G7erJyZWmHxaoirdjj28W
         i+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063987; x=1790668787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dP1zCMCErPeK9F1TnlfMVGvOu9U8paGR+gGJEZKdb/E=;
        b=zX+oE5oRZaRRI0Q33rA8jZ7jA8sf3rp7XKPFkJZw6ac3HZuen1yuqHPeM27F53F7WA
         BRV166KruyfDteWt0iisHuZd51mpGtaeNM1VLGHWPlkUTd2QAEQ106vwSM1GXv+tfdU7
         vzUCwHoDofVbkuh46xf5wRmC2QWI9LXNugRcHJ4yJQCzenrMMCUbKCfi9d4o8ZIkUgGA
         YsdSN9WYKg5Qyi5uxq6gtoJaKA0q02oOXEG+aOZVeRpPzD7IUsZTCFh2tqKmt2HiXT9P
         0b+DKwY6cSpLuRPKIebAqZYVarguBNn0clgUQ3yOwLPitvK3cHeliKf1nsuEXq54rjgZ
         YlGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlTn90IiOXT9famlBvilqJdByXsfa/7UwgIXzLYQtKe23Q2LdmyLZObCUQW1lt/r3ofK4=@lists.linux.dev
X-Gm-Message-State: AFuF++l8l9CABmGrhB98ZqMz5DNx34dJjs6AS4tfhbcpb6mLjM4eWilT
	lvOzLCkI+2yLdrC5vQDYczGOg94vPcKpoorAly2AJKrS9/zha6UyrmnCOqURUO7FDYyRrNlaOLE
	mkzFoiqMEmz76MOzdDgOFY74rnskUmoA=
X-Gm-Gg: AYBFou0UPbXkh/5Hwj0pIKyCjNwTLFBDI8p4wAhor9hKzVHLVMiUOi3tVoEtAKNAlYr
	Z43nQgSB3BL53tYGZB3aPObD1ez6yCrwFet7vHZXUb00mT4HUfpwQWlqI+5d51KK7TYPOPreYEN
	KQQBpde7bunUF1HsM5T5bioE7OVquC/NLoueDUPmylgN+aoZqDaswxoQVExLcTjcIeYRaYX8Wep
	lhX1Zfnw6jWiXtLFOIVwczR61YXhUsCbqNLDVIzcGeG8npSUaNCxN+oppJ4MveUnDA0MdTGAhI6
	bJITfoMNbxUeDL7Dwd5LiqaJekwAzYheV30Lci107rRwIOY+7PTKBpK5iw==
X-Received: by 2002:a05:690e:4105:b0:66f:c2c7:3a4f with SMTP id
 956f58d0204a3-6717fca0d13mr4306035d50.19.1790063987418; Tue, 22 Sep 2026
 00:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921104058.353748-1-lgs201920130244@gmail.com> <20260921110512.GS106095@black.igk.intel.com>
In-Reply-To: <20260921110512.GS106095@black.igk.intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:59:32 +0800
X-Gm-Features: AcwNN1XxyQQU5x2vBD_1jw2pjdvTRbzVQZFCGqidJ6ftnuC_3eRhT9BLr4HUSn0
Message-ID: <CANUHTR9gA-mKn8Y496Pty4_Fhu3BSSyhXWrmiod1WvuVdQjkag@mail.gmail.com>
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mika,

Thanks for the suggestion.

On Mon, 21 Sept 2026 at 19:05, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 21, 2026 at 06:40:58PM +0800, Guangshuo Li wrote:
> > intel_lpss_probe() may register an iDMA MFD child before registering
> > the main controller cell. If the iDMA child is registered successfully
> > but the subsequent mfd_add_devices() call for the main cell fails, the
> > probe error path returns without removing the already registered iDMA
> > device.
> >
> > Since the normal remove callback is not called after a failed probe,
> > the iDMA platform device remains registered and is never released.
> >
> > Call mfd_remove_devices() on the probe error path to remove any MFD
> > children that were successfully registered before the main cell
> > registration failed.
>
> I think this could use devm_mfd_add_devices() instead.
>
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS devices")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/intel-lpss.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> > index 63d6694f7145..657b1e3fb896 100644
> > --- a/drivers/mfd/intel-lpss.c
> > +++ b/drivers/mfd/intel-lpss.c
> > @@ -455,6 +455,7 @@ int intel_lpss_probe(struct device *dev,
> >       return 0;
> >
> >  err_remove_ltr:
> > +     mfd_remove_devices(dev);
> >       intel_lpss_debugfs_remove(lpss);
> >       intel_lpss_ltr_hide(lpss);
> >       intel_lpss_unregister_clock(lpss);
> > --
> > 2.43.0

Do you mean converting both MFD registrations to devm_mfd_add_devices()
and dropping the explicit mfd_remove_devices() from the remove path, like
this?

        if (intel_lpss_has_idma(lpss)) {
-               ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,
-                                     1, info->mem, info->irq, NULL);
+               ret = devm_mfd_add_devices(dev, lpss->devid,
+                                          &intel_lpss_idma64_cell, 1,
+                                          info->mem, info->irq, NULL);
                if (ret)
                        dev_warn(dev, "Failed to add %s, fallback to PIO\n",
                                 LPSS_IDMA64_DRIVER_NAME);
        }

-       ret = mfd_add_devices(dev, lpss->devid, lpss->cell,
-                             1, info->mem, info->irq, NULL);
+       ret = devm_mfd_add_devices(dev, lpss->devid, lpss->cell,
+                                  1, info->mem, info->irq, NULL);
        if (ret)
                goto err_remove_ltr;

...

 void intel_lpss_remove(struct device *dev)
 {
        struct intel_lpss *lpss = dev_get_drvdata(dev);

-       mfd_remove_devices(dev);
        intel_lpss_debugfs_remove(lpss);
        intel_lpss_ltr_hide(lpss);
        intel_lpss_unregister_clock(lpss);
        ida_free(&intel_lpss_devid_ida, lpss->devid);
 }

Would this be the preferred change?

Thanks,
Guangshuo
