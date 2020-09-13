<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		
		<title> ${userInfo.name } | Portfolio</title>
		
		
		<!--=====================================================
			CSS Stylesheets
		=====================================================-->
		<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css' >
		<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath }/css/linea.css' >
		<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath }/css/ionicons.min.css' >
		<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath }/css/owl.carousel.css' >
		<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath }/css/magnific-popup.css' >
		<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath }/css/style.css' >
		
	</head>
	<body>
		
		
		<!--=====================================================
			Preloader
		=====================================================-->
		<div id='preloader' >
			<div class='loader' ></div>
			<div class='left' ></div>
			<div class='right' ></div>
		</div>
		
		
		<div class='main-content' >
			
			<!--=====================================================
				Page Borders
			=====================================================-->
			<div class='page-border border-left' ></div>
			<div class='page-border border-right' ></div>
			<div class='page-border border-top' ></div>
			<div class='page-border border-bottom' ></div>
			
			
			
			<!--=====================================================
				Menu Button
			=====================================================-->
			<a href='#' class='menu-btn' >
				<span class='lines' >
					<span class='l1' ></span>
					<span class='l2' ></span>
					<span class='l3' ></span>
				</span>
			</a>
			
			
			<!--=====================================================
				Menu
			=====================================================-->
			<div class='menu' >
				<div class='inner' >
					<ul class='menu-items' >
						
						<li>
							<a href='#' class='section-toggle' data-section='intro' >
								Home
							</a>
						</li>
						
						<li>
							<a href='#about' class='section-toggle' data-section='about' >
								About
							</a>
						</li>
						
						<li>
							<a href='#portfolio' class='section-toggle' data-section='portfolio' >
								Portfolio
							</a>
						</li>
						
						
						<li>
							<a href='#contact' class='section-toggle' data-section='contact' >
								Contact
							</a>
						</li>
						
						
					</ul>
				</div>
			</div>
			
			<div class='animation-block' ></div>
			
			  
			<!--=====================================================
				Sections
			=====================================================-->
			<div class='sections' >
			
				
				<!--=====================================================
					Main Section
				=====================================================-->
				<section id='intro' class='section section-main active' >
					
					<div class='container-fluid' >
						
						<div class='v-align' >
						
						
							<div class='inner' >
							
								<div class='intro-text' >
									
									<h1>I'm ${userInfo.name } ${userInfo.surname }</h1>
									
									<p>
										${userInfo.shortDescription }
									</p>
									
									<div class='intro-btns' >
										
										<a href='#about' class='btn-custom section-toggle' data-section='about' >
											Discover More
										</a>
										
										<a href='#contact' class='btn-custom section-toggle' data-section='contact' >
											Hire Me
										</a>
										
									</div>
									
								</div>
							</div>
							
						</div>
						
					</div>
				
				</section>
				
				
				<!--=====================================================
					About Section
				=====================================================-->
				<section id='about' class='section about-section border-d' >
					
					<div class='section-block about-block' >
						<div class='container-fluid' >
							
							<div class='section-header' >
								<h2>
									I'm a <strong class='color' >Back-End Developer</strong>
								</h2>
							</div>
							
							<div class='row' >
								
								<div class='col-md-4' >
									
									<ul class='info-list' >
										
										<li>
											<strong>Name:</strong>
											<span>${userInfo.name } ${userInfo.surname }</span>
										</li>
										
										<li>
											<strong>Age:</strong>
											<span>${userInfo.age }</span>
										</li>
										
										<li>
											<strong>Residence:</strong>
											<span>${userInfo.residence }</span>
										</li>
										
										
									</ul>
									
								</div>
								
								<div class='col-md-8' >
								
									<div class='about-text' >
										<p>
											${userInfo.longDescription }
										</p>
										
									</div>
								</div>
								
							</div>
							
						</div>
					</div>
					
				</section>
				
				
				
				<!--=====================================================
					Portfolio Section
				=====================================================-->
				<section id='portfolio' class='section portfolio-section border-d' >
					
					<div class='section-block portfolio-block' >
						
						<div class='container-fluid' >
							
							
							<div class='section-header' >
								<h2>My <strong class='color' >Projects</strong></h2>
							</div>
							
							
							
							<ul class='portfolio-items' >
						      <c:forEach begin="0" end="${projectList.size() - 1 }" var="i">
								<li>
									<div class='inner' >
										<img src="${projectList[i].image }" alt>
										<div class='overlay' >
											<a href='#popup-${i }' class='view-project' >
												View Project
											</a>
											<!--project popup-->
											<div id='popup-${i }' class='popup-box zoom-anim-dialog mfp-hide' >
												<figure>
													<!--project popup image-->
													<img src="${projectList[i].image }" alt>
												</figure>
												<div class='content' >
													<!--project popup title-->
													<a class="lead text-muted" href="${projectList[i].link }">${projectList[i].name }</a>
													<!--project popup description-->
													<p>
														${projectList[i].description }
													</p>
												</div>
											</div>
										</div>
									</div>
								</li>
							  </c:forEach>
							</ul>
							
						</div>
					
					</div>
					
				</section>
				
				
				<!--=====================================================
					Contact Section
				=====================================================-->
				<section id='contact' class='section contact-section border-d' >
					
					<div class='section-block contact-block' >
						
						<div class='container-fluid' >
							
							<div class='section-header' >
								<h2>Contact <strong class='color' >Me</strong></h2>
							</div>
							
							<div class='row' >
							
								<div class='col-md-8' >
									
									<div class='contact-form' >
									
										<form:form action="message-save" modelAttribute="message"  class="commenting-form" >
										
										
											<div class='row' >
												
												<div class='col-md-6' >
													<div class='form-group' >
														
														<form:input path="name" type='text' class='form-control' placeholder='Name   (3-45 characters)'/>
														<form:errors path="name" cssClass="text-danger"></form:errors>
														
													</div>												
												</div>
												
												<div class='col-md-6' >
													<div class='form-group' >
														
														<form:input path="email" type='email' class='form-control' placeholder='Email' />
													
													</div>
												</div>
												
											</div>
											
											<div class='form-group' >
												
												<form:input path="subject" type='text' class='form-control' placeholder='Subject   (3-70 characters)' />
												<form:errors path="subject" cssClass="text-danger"></form:errors>
												
											</div>
											
											<div class='form-group' >
												
												<form:textarea path="message" class='form-control' placeholder='Message   (10-1000 characters)'/>
												<form:errors path="message" cssClass="text-danger"></form:errors>
												
											</div>
											
											<div class='form-group text-center' >
												<button type='submit' class='btn-custom btn-color' >
													Send Message
												</button>
											</div>
											
										</form:form>
										
									</div>
									
									
								</div>
								
								<div class='col-md-4' >
										
									<div class="text-center">	
										<div class='text-muted'>
											<h4 class="lead">Contact Info</h4>
										</div>
										
										<div class='text-primary' >
											
											<em class="text-muted">email:</em>  ${userInfo.username }
											
										</div>
										
										<div class='text-primary' >
											
											<em class="text-muted">phone:</em>  ${userInfo.phone }
											
										</div>
										
										
										<div class='text-muted'>
											<h4 class="lead">Social Media</h4>
										</div>
										
										<div class='text-secondary' >
											
											<strong><a href="${userInfo.linkedIn }" target="_blank">LinkedIn</a></strong>
											
										</div>
										<div class="text-secondary">
										
											<strong><a href="${userInfo.git }" target="_blank">GitHub</a></strong>
										
										</div>
										
										<div class='text-muted'>
											<h4 class="lead">Curriculum Vitae</h4>
										</div>
										<div class='text-secondary' >
											
											<strong><a href="${userInfo.CVEnglish }" target="_blank">English</a></strong>
											
										</div>
										<div class="text-secondary">
										
											<strong><a href="${userInfo.CVSerbian }" target="_blank">Serbian</a></strong>
										
										</div>
										
									</div>
								</div>
								
								
							</div>
							
							
							
						</div>
					
					</div>
					
				</section>
				
			</div>
			
		</div>
		
		
		<!--=====================================================
			JavaScript Files
		=====================================================-->
		<script src='${pageContext.request.contextPath }/js/jquery.min.js' ></script>
		<script src='${pageContext.request.contextPath }/js/jquery.shuffle.min.js' ></script>
		<script src='${pageContext.request.contextPath }/js/owl.carousel.min.js' ></script>
		<script src='${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js' ></script>
		<script src='${pageContext.request.contextPath }/js/validator.min.js' ></script>
		<script src='${pageContext.request.contextPath }/js/script.js' ></script>
		
	</body>
</html>