# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CarBrand.create(title: "Tesla")
CarBrand.create(title: "Toyota")
CarBrand.create(title: "Hyundai")
CarBrand.create(title: "Isuzu")

CarModel.create(title: "Tesla1")
Page.destroy_all
Page.create(title: "Terms & Conditions", permalink: "terms&condition",content: "<h2>Welcome to housibly!</h2> </n> <p> These terms and conditions outline the rules and regulations for the use of Housibly's Website, located at <a>www.housibly.com.</a> </p> </n> <p> By accessing this website we assume you accept these terms and conditions. Do not continue to use housibly if you do not agree to take all of the terms and conditions stated on this page. </p> </n> <p> The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: <q>Client</q>, <q>You</q> and <q>Your</q> refers to you, the person log on this website and compliant to the Company’s terms and conditions. <q>The Company</q>, <q>Ourselves</q>, <q>We</q>, <q>Our</q> and <q>Us</q>, refers to our Company. <q>Party</q>, <q>Parties</q>, or <q>Us</q>, refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken. </p>")
Page.create(title: "Privacy Policy", permalink: "privacy_policy",content: "<h2>Welcome to housibly!</h2> </n> </n> <p> We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights. </p> </n> <h2>Please read Privacy Policy</h2> </n> <p> Reservation of Rights We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions. </p> </n> <h2>Removal of links from our website</h2> </n> <p> If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but . </p>")
Page.create(title: "FAQ", permalink: "faq",content: "<h2>Welcome to housibly!</h2> </n> <p> The following organizations may link to our Website without prior written approval: </p> <ul> <li>Government agencies;</li> <li>Search engines;</li> <li>News organizations;</li> <li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site. </li> </ul> </n> <p> These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site. </p> </n> <p> We may consider and approve other link requests from the following types of organizations: </p>")
